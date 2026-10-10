# .ExternalHelp PoShPACLI-help.xml
function Set-PVLocation {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$quota
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand UPDATELOCATION -CommandParameters ($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote quota)



	}

}