# .ExternalHelp PoShPACLI-help.xml
function Remove-PVRule {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ruleID,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$userName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$safeName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fullObjectName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$isFolder
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETERULE -CommandParameters ($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote ruleID)



	}

}