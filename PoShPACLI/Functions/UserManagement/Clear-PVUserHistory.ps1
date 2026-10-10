Function Clear-PVUserHistory {

	<#
	.SYNOPSIS
	Clears the history records for Users of the specified Vault

	.DESCRIPTION
	Exposes the PACLI Function: "CLEARUSERHISTORY"

	.EXAMPLE
	Clear-PVUserHistory

	Clears the history records for Users of the Vault

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param()

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath CLEARUSERHISTORY $($PSBoundParameters | ConvertTo-ParameterString)



	}

}