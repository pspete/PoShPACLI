Function Disconnect-PVVault {

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

	[CmdLetBinding()]
	param()

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath LOGOFF $($PSBoundParameters | ConvertTo-ParameterString)

	}

}
