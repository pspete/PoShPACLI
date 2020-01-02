Function Lock-PVUser {

	<#
	.SYNOPSIS
	Locks the current User’s CyberArk account.

	.DESCRIPTION
	Exposes the PACLI Function: "LOCK"

	.EXAMPLE
	Lock-PVUser

	Locks the current user

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param()

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath LOCK $($PSBoundParameters | ConvertTo-ParameterString)



	}

}