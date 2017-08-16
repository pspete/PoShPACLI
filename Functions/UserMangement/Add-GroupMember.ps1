Function Add-GroupMember {

	<#
	.SYNOPSIS
		Adds a CyberArk User to an existing CyberArk group

	.DESCRIPTION
		Exposes the PACLI Function: "ADDGROUPMEMBER"

	.PARAMETER vault
		The name of the Vault containing the group.

	.PARAMETER user
		The Username of the User who is carrying out the command

	.PARAMETER group
		The name of the group.

	.PARAMETER member
		The name of the User to add to the group.

	.PARAMETER sessionID
		The ID number of the session. Use this parameter when working
		with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
		add-groupmember -vault Lab -user administrator -group xGroup1 -member xUser1

		Adds user xUser1 to group xGroup1

	.NOTES
		AUTHOR: Pete Maan
		LASTEDIT: August 2017
	#>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$group,
		[Parameter(Mandatory = $True)][string]$member,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDGROUPMEMBER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}