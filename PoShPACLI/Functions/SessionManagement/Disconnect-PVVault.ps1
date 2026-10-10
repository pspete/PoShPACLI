function Disconnect-PVVault {

	<#
	.SYNOPSIS
	This command enables log off from the Vault

	.DESCRIPTION
	Exposes the PACLI Function: "LOGOFF"

	.EXAMPLE
	Disconnect-PVVault

	Logs off from vault

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdletBinding()]
	param()

	process {

		$Null = Invoke-PACLICommand -PacliCommand LOGOFF -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)

	}

}
