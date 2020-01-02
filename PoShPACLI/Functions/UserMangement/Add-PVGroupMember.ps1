Function Add-PVGroupMember {

	<#
	.SYNOPSIS
	Adds a CyberArk User to an existing CyberArk group

	.DESCRIPTION
	Exposes the PACLI Function: "ADDGROUPMEMBER"

	.PARAMETER group
	The name of the group.

	.PARAMETER member
	The name of the User to add to the group.

	.EXAMPLE
	Add-PVGroupMember -group xGroup1 -member xUser1

	Adds user xUser1 to group xGroup1

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
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

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDGROUPMEMBER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}