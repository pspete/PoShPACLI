# .ExternalHelp PoShPACLI-help.xml
function Remove-PVNetworkArea {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETENETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}