# .ExternalHelp PoShPACLI-help.xml
function Import-PVVaultDefinition {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parmFile,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault
	)

	process {



		$Return = Invoke-PACLICommand -PacliCommand DEFINEFROMFILE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser)

		if ($Return.ExitCode -eq 0) {

			Set-PVConfiguration -vault $vault

		}

	}

}