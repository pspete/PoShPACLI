Function Remove-PVGroupMember {

	<#
	.SYNOPSIS
	Removes a User as a member from a CyberArk group.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEGROUPMEMBER"

	.PARAMETER group
	The name of the group.

	.PARAMETER member
	The name of the group member to delete

	.EXAMPLE
	Remove-PVGroupMember -group auditors -member WebService

	Deletes "WebService" as a member of vault group "Auditors"

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Groupname")]
		[string]$group,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$member
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEGROUPMEMBER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}