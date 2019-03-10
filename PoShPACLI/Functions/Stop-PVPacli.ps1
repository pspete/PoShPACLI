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

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	$Return = Invoke-PACLICommand $Script:PV.ClientPath TERM $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)

	if($Return.ExitCode -eq 0) {

		Write-Verbose "Pacli Stopped"

	}

}