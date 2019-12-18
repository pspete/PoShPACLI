Function Remove-PVVaultDefinition {

	<#
	.SYNOPSIS
	Deletes a Vault definition

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEVAULT"

	.PARAMETER vault
	The name of the Vault to delete.

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	Remove-PVVaultDefinition -vault "Demo Vault"

	Deletes "Demo Vault" vault definition.

	.NOTES
	No longer supported from version 5.5

	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

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

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DELETEVAULT $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)

	}

}