# .ExternalHelp PoShPACLI-help.xml
function Disable-PVTrustedNetworkArea {

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

		$Null = Invoke-PACLICommand -PacliCommand DEACTIVATETRUSTEDNETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}