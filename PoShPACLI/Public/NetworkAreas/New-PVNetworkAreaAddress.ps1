# .ExternalHelp PoShPACLI-help.xml
function New-PVNetworkAreaAddress {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ipAddress,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ipMask,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$toAddress
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand ADDAREAADDRESS -CommandParameters ($PSBoundParameters |
			ConvertTo-ParameterString -doNotQuote ipAddress, ipMask, toAddress)



	}

}