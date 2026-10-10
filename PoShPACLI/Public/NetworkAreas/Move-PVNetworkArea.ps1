# .ExternalHelp PoShPACLI-help.xml
function Move-PVNetworkArea {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newLocation
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand MOVENETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}