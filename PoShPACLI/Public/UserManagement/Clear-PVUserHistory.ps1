# .ExternalHelp PoShPACLI-help.xml
function Clear-PVUserHistory {

	[CmdletBinding()]
	param()

	process {

		$Null = Invoke-PACLICommand -PacliCommand CLEARUSERHISTORY -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}