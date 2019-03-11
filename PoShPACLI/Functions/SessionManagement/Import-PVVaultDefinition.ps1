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
	The name of the Vault to create. This name can also be
	specified in the text file, although specifying it in this command
	overrides the Vault name in the file.

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	Import-PVVaultDefinition -parmFile D:\PACLI\Vault.ini -vault "Demo Vault"

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
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		Write-Verbose "Defining Vault"

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DEFINEFROMFILE $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "Vault Config Read"

			[PSCustomObject] @{

				"vault"     = $vault
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}