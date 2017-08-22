Function Remove-PVGroupMember {

	<#
	.SYNOPSIS
		Removes a User as a member from a CyberArk group.

	.DESCRIPTION
		Exposes the PACLI Function: "DELETEGROUPMEMBER"

	.PARAMETER vault
		The name of the Vault containing the group.

	.PARAMETER user
		The Username of the User who is carrying out the command

	.PARAMETER group
		The name of the group.

	.PARAMETER member
		The name of the group member to delete

	.PARAMETER sessionID
		The ID number of the session. Use this parameter when working
		with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
		Remove-PVGroupMember -vault Lab -user administrator -group auditors -member WebService

		Deletes "WebService" as a member of vault group "Auditors"

	.NOTES
		AUTHOR: Pete Maan
		LASTEDIT: August 2017
	#>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$group,
		[Parameter(Mandatory = $True)][string]$member,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEGROUPMEMBER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Deleted User $member From $group"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}