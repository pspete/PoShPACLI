function Lock-PVUser {

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

	[CmdletBinding()]
	param()

	process {

		$Null = Invoke-PACLICommand -PacliCommand LOCK -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}