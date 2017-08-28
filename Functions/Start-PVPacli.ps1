Function Start-PVPacli {

	<#
    .SYNOPSIS
    	Starts the PACLI executable. This command must be run before any other
        commands.

    .DESCRIPTION
    	Exposes the PACLI Function: "INIT"

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .PARAMETER  ctlFileName
        The full path of the file that contains the Certificate Trust List (CTL).

    .EXAMPLE
    	Start-PVPacli -sessionID $PID

        Starts the PACLI process with a session ID equal to the process ID of the current
        Powershell process.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][int]$sessionID,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][string]$ctlFileName
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		Write-Verbose "Starting Pacli"

		$Return = Invoke-PACLICommand $pacli INIT $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Pacli Started"


			[pscustomobject] @{

				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}