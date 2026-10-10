# .ExternalHelp PoShPACLI-help.xml
function Rename-PVLocation {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newName
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand RENAMELOCATION -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}