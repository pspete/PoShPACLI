Function Stop-PACLI {

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
    	Stop-PACLI
        Ends the PACLI process with a session ID of 0

    .EXAMPLE
    	Stop-PACLI -sessionID 7
        Ends the PACLI process with a session ID of 7

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		Write-Verbose "Stopping Pacli"

		$Return = Invoke-PACLICommand $pacli TERM $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			Write-Verbose "Error Stopping Pacli"

			#Return FALSE
			$false

		}

		Else {

			Write-Verbose "Pacli Stopped"

			#return TRUE
			$true

		}

	}

}