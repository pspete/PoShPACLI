# .ExternalHelp PoShPACLI-help.xml
function Rename-PVSafe {

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
		[string]$newName
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand RENAMESAFE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}