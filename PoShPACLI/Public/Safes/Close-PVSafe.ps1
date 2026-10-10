# .ExternalHelp PoShPACLI-help.xml
function Close-PVSafe {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand CLOSESAFE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}