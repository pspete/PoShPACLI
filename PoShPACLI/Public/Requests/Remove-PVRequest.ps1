# .ExternalHelp PoShPACLI-help.xml
function Remove-PVRequest {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$requestID
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETEREQUEST -CommandParameters ($PSBoundParameters |
			ConvertTo-ParameterString -doNotQuote requestID)



	}

}