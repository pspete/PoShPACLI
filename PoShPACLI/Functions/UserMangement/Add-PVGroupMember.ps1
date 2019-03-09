Function Add-PVGroupMember {

	<#
	.SYNOPSIS
		Adds a CyberArk User to an existing CyberArk group

	.DESCRIPTION
		Exposes the PACLI Function: "ADDGROUPMEMBER"

	.PARAMETER vault
        The defined Vault name

	.PARAMETER user
        The Username of the authenticated User.

	.PARAMETER group
		The name of the group.

	.PARAMETER member
		The name of the User to add to the group.

	.PARAMETER sessionID
		The ID number of the session. Use this parameter when working
		with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
		Add-PVGroupMember -vault Lab -user administrator -group xGroup1 -member xUser1

		Adds user xUser1 to group xGroup1

	.NOTES
		AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Groupname")]
		[string]$group,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$member,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath ADDGROUPMEMBER $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "User $member Added to $group"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}