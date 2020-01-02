Function Import-PVVaultDefinition {

	<#
	.SYNOPSIS
	Defines a new Vault with parameters that reside in a text file.

	.DESCRIPTION
	Exposes the PACLI Function: "DEFINEFROMFILE"

	.PARAMETER parmFile
	The full pathname of the file containing the parameters for
	defining the Vault.

	.PARAMETER vault
	The name of the Vault to create. This overrides any Vault name specyfied in the vault parameter file.

	.EXAMPLE
	Import-PVVaultDefinition -parmFile D:\PACLI\Vault.ini -vault "DemoVault"

	Defines a new vault connection using the details specified in the Vault.ini parameter file.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
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

	PROCESS {



		$Return = Invoke-PACLICommand $Script:PV.ClientPath DEFINEFROMFILE $($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser)

		if ($Return.ExitCode -eq 0) {

			Set-PVConfiguration -vault $vault

		}

	}

}