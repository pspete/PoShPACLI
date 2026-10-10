# .ExternalHelp PoShPACLI-help.xml
function Start-PVPacli {

	[CmdletBinding(SupportsShouldProcess)]
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

	process {

		$Return = Invoke-PACLICommand -PacliCommand INIT -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser -NoSessionID)

		if ($Return.ExitCode -eq 0) {

			Set-PVConfiguration -sessionID $sessionID

		}

	}

}