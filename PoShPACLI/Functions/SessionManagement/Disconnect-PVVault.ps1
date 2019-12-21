Function Disconnect-PVVault {

	<#
	.SYNOPSIS
	This command enables log off from the Vault

	.DESCRIPTION
	Exposes the PACLI Function: "LOGOFF"

	.EXAMPLE
	Disconnect-PVVault

	Logs off administrator from defined vault VaultA

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param()

	PROCESS {
		$Return = Invoke-PACLICommand $Script:PV.ClientPath LOGOFF $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)
	}

}
