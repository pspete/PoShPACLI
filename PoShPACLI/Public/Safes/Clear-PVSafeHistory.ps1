# .ExternalHelp PoShPACLI-help.xml
function Clear-PVSafeHistory {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand CLEARSAFEHISTORY -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}