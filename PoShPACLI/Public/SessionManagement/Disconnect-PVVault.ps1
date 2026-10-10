# .ExternalHelp PoShPACLI-help.xml
function Disconnect-PVVault {

	[CmdletBinding()]
	param()

	process {

		$Null = Invoke-PACLICommand -PacliCommand LOGOFF -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)

	}

}
