# .ExternalHelp PoShPACLI-help.xml
function Enable-PVTrustedNetworkArea {

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
		[string]$networkArea
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand ACTIVATETRUSTEDNETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}