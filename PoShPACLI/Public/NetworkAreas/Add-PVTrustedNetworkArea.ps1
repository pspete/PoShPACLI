# .ExternalHelp PoShPACLI-help.xml
function Add-PVTrustedNetworkArea {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$trusterName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$fromHour,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$toHour,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$maxViolationCount
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand ADDTRUSTEDNETWORKAREA -CommandParameters ($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote fromHour, toHour, maxViolationCount)



	}

}