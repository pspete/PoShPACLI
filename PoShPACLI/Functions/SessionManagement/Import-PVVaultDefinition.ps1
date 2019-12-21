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
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault
	)

	PROCESS {

		

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DEFINEFROMFILE $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			$Script:PV | Add-Member -MemberType NoteProperty -Name vault -Value $vault

		}

	}

}