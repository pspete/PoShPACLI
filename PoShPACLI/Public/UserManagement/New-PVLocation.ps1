# .ExternalHelp PoShPACLI-help.xml
function New-PVLocation {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$quota
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand ADDLOCATION -CommandParameters ($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote quota)



	}

}