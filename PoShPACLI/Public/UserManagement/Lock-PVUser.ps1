# .ExternalHelp PoShPACLI-help.xml
function Lock-PVUser {

	[CmdletBinding()]
	param()

	process {

		$Null = Invoke-PACLICommand -PacliCommand LOCK -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}