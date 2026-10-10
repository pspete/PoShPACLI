# .ExternalHelp PoShPACLI-help.xml
function Remove-PVCTLCertificate {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ctlFileName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$certFileName
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand CTLREMOVECERT -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser)

	}

}