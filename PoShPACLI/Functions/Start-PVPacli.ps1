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
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ctlFileName
	)

	$Return = Invoke-PACLICommand $Script:PV.ClientPath INIT $($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser -NoSessionID)

	if ($Return.ExitCode -eq 0) {

		Set-PVConfiguration -sessionID $sessionID

	}

}