Function Stop-PVPacli {

	<#
    .SYNOPSIS
    	This command terminates PACLI. Always run this at the end of every working
        session.

    .DESCRIPTION
    	Exposes the PACLI Function: "TERM"

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Stop-PVPacli
        Ends the PACLI process with a session ID of 0

    .EXAMPLE
    	Stop-PVPacli -sessionID 7
        Ends the PACLI process with a session ID of 7

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		Write-Verbose "Stopping Pacli"

		$Return = Invoke-PACLICommand $pacli TERM $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		Else {

			Write-Verbose "Pacli Stopped"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}