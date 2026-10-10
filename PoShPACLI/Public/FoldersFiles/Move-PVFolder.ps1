# .ExternalHelp PoShPACLI-help.xml
function Move-PVFolder {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newLocation
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand MOVEFOLDER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}