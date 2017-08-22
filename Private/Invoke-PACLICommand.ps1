Function Invoke-PACLICommand {

	<#
    .SYNOPSIS
	Runs an executable with specified command and arguments

    .DESCRIPTION
	Designed to start PACLI process with PACLI Command a arguments required for that command.

	Returns Object containing ExitCode, StdOut & StdErr

	.PARAMETER PacliEXE
	The executable to run (i.e. PACLI.EXE)

	.PARAMETER PacliCommand
	The command for the executable (i.e. INIT)

	.PARAMETER CommandParameters
	The parameters for the command i.e. vault="name" this="true" number=88 OUTPUT (ALL,ENCLOSE)

    .EXAMPLE
	Invoke-PACLICommand $pacli PACLICMD "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

	Will execute PACLI.EXE PACLICMD Param1="Value" Param2="Value" Param3="Value" OUTPUT (ALL,ENCLOSE)

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, Position = 1)]
		[string]$PacliEXE,
		[Parameter(Mandatory = $True, Position = 2)]
		[string]$PacliCommand,
		[Parameter(Mandatory = $False, Position = 3)]
		[string]$CommandParameters
	)

	Begin {

		#Create process
		$PacliProcess = new-object System.Diagnostics.Process

	}

	Process {

		if ($PSCmdlet.ShouldProcess($PacliEXE, "$PacliCommand $CommandParameters")) {

			Write-Debug "PACLI Command: $PacliCommand $CommandParameters"

			#Assign process parameters
			$PacliProcess.StartInfo.Filename = $PacliEXE
			$PacliProcess.StartInfo.Arguments = "$PacliCommand $CommandParameters"
			$PacliProcess.StartInfo.RedirectStandardOutput = $True
			$PacliProcess.StartInfo.RedirectStandardError = $True
			$PacliProcess.StartInfo.UseShellExecute = $False

			#Start Process
			$PacliProcess.start()

			#Read Output Stream First
			$StdOut = $PacliProcess.StandardOutput.ReadToEnd()
			$StdErr = $PacliProcess.StandardError.ReadToEnd()

			#If you wait for the process to exit before reading StandardOutput
			#the process can block trying to write to it, so the process never ends.
			$PacliProcess.WaitForExit()

			Write-Debug "Exit Code: $($PacliProcess.ExitCode)"

		}

	}

	End {

		[PSCustomObject] @{

			"ExitCode" = $PacliProcess.ExitCode
			"StdOut"   = $StdOut
			"StdErr"   = $StdErr

		}

		$PacliProcess.Dispose()

	}

}