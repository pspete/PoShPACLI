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

		[Parameter(Mandatory = $False,
			ValueFromPipelineByPropertyName = $False,
			ValueFromRemainingArguments = $true
		)]
		$RemainingArgs
	)

	Begin {

		Try {

			Get-Variable -Name PV -ErrorAction Stop

			if ( ($PV.PSObject.Properties.Name -notcontains "ClientPath") -or (-not (Test-Path -Path $PV.ClientPath -PathType Leaf)) ) {

				Write-Error "Heads Up!" -ErrorAction Stop

			}

		}
		Catch { throw "PACLI.exe not found. Run Set-PVConfiguration to set PACLI client path" }

		#Create process
		$Process = new-object System.Diagnostics.Process

	}

	Process {

		if ($PSCmdlet.ShouldProcess($PacliEXE, "$PacliCommand $CommandParameters")) {

			Write-Debug "PACLI Command: $PacliCommand $(Hide-SecretValue -InputValue $CommandParameters)"

			#Assign process parameters
			$Process.StartInfo.WorkingDirectory = "$(Split-Path $PacliEXE -Parent)"
			$Process.StartInfo.Filename = $PacliEXE
			$Process.StartInfo.Arguments = "$PacliCommand $CommandParameters"
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