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

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[int]$sessionID,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[string]$ctlFileName
	)

	Write-Verbose "Starting Pacli"

	$Return = Invoke-PACLICommand $pacli INIT $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)

	if($Return.ExitCode -eq 0) {

		Write-Verbose "Pacli Started"


		[pscustomobject] @{

			"sessionID" = $sessionID

		} | Add-ObjectDetail -TypeName pacli.PoShPACLI

	}

}