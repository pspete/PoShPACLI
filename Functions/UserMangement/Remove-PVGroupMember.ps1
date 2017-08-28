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

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEGROUPMEMBER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Deleted User $member From $group"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}