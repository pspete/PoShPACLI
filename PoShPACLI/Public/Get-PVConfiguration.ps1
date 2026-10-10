# .ExternalHelp PoShPACLI-help.xml
function Get-PVConfiguration {

	[CmdletBinding()]
	Param()


	process {

		try {

			Get-Variable -Name PV -Scope Script -ValueOnly -ErrorAction Stop

		}
		catch {

			throw "PVConfiguration not found. Run Set-PVConfiguration."

		}

	}


}