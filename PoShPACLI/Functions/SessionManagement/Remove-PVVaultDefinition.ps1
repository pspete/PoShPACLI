Function Remove-PVVaultDefinition {

	<#
	.SYNOPSIS
	Deletes a Vault definition

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEVAULT"

	.EXAMPLE
	Remove-PVVaultDefinition

	Deletes "Demo Vault" vault definition.

	.NOTES
	No longer supported from version 5.5

	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param()

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DELETEVAULT $($PSBoundParameters | ConvertTo-ParameterString -NoUser)
		
		if ($Return.ExitCode -eq 0) {

			$Script:PV.PSObject.Properties.Remove('vault')

		}

	}

}