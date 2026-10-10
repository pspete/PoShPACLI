Function Invoke-PACLICommand {

	<#
	.SYNOPSIS
	Defines specified PACLI command and arguments

    .DESCRIPTION
	Defines a PACLI process object with arguments required for specific command.

	.PARAMETER PacliEXE
	The Path to PACLI.exe.
	Defaults to value of $Script:PV.ClientPath, which is set during module import or via Set-PVConfiguration.

	.PARAMETER PacliCommand
	The PACLI command to execute, like INIT

	.PARAMETER CommandParameters
	The parameters for the command i.e. vault="name" this="true" number=88

	.PARAMETER SecretParameters
	Hashtable of parameters for the command; any SecureString values are decoded into the PACLI command line.
	Secret values are masked in WhatIf and Debug output.

    .EXAMPLE
	Invoke-PACLICommand $Script:PV.ClientPath PACLICMD "$($PSBoundParameters | ConvertTo-ParameterString)

	Will execute PACLI.EXE PACLICMD Param1="Value" Param2="Value" Param3="Value"

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True,
			Position = 1
		)]
		[string]$PacliEXE = $Script:PV.ClientPath,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True,
			Position = 2
		)]
		[string]$PacliCommand,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True,
			Position = 3
		)]
		[string]$CommandParameters,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False
		)]
		[System.Collections.IDictionary]$SecretParameters
	)

	Begin {

		Try {

			$null = Get-Variable -Name PV -ErrorAction Stop

			if ( ($PV.PSObject.Properties.Name -notcontains "ClientPath") -or (-not (Test-Path -Path $PV.ClientPath -PathType Leaf)) ) {

				Write-Error "Heads Up!" -ErrorAction Stop

			}

		}
		Catch { throw "PACLI.exe not found. Run Set-PVConfiguration to set PACLI client path" }

		#Create process
		$Process = [System.Diagnostics.Process]::new()

	}

	Process {

		$Secrets = @()
		if ($SecretParameters) {
			$Secrets = @($SecretParameters.Keys | Where-Object { $SecretParameters[$PSItem] -is [securestring] })
		}

		$MaskedParameters = (@($Secrets | ForEach-Object { '{0}="******"' -f $PSItem }) + $CommandParameters) -join ' '

		if ($PSCmdlet.ShouldProcess($PacliEXE, "$PacliCommand $MaskedParameters")) {

			Write-Debug "PACLI Command: $PacliCommand $MaskedParameters"

			$Arguments = [System.Text.StringBuilder]::new($PacliCommand)
			foreach ($Secret in $Secrets) {
				$null = $Arguments.AppendFormat(' {0}="{1}"', $Secret, (ConvertTo-InsecureString -SecureString $SecretParameters[$Secret]))
			}
			$null = $Arguments.Append(" $CommandParameters")

			#Assign process parameters
			$Process.StartInfo.WorkingDirectory = "$(Split-Path $PacliEXE -Parent)"
			$Process.StartInfo.Filename = $PacliEXE
			$Process.StartInfo.Arguments = $Arguments.ToString()
			$Process.StartInfo.RedirectStandardOutput = $True
			$Process.StartInfo.RedirectStandardError = $True
			$Process.StartInfo.UseShellExecute = $False
			$Process.StartInfo.CreateNoWindow = $True
			$Process.StartInfo.WindowStyle = "hidden"

			#Start Process
			$Result = Start-ClientProcess -Process $Process

			if ($Result.StdErr) {

				Write-Error -Message "$($Result.StdErr)"

			}
			Else { $Result }

		}

	}

	End {

		$Process.Dispose()

	}

}