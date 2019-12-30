Function Set-PVGroup {

	<#
	.SYNOPSIS
	Updates CyberArk Group properties.

	.DESCRIPTION
	Exposes the PACLI Function: "UPDATEGROUP"

	.PARAMETER group
	The name of the group to update.

	.PARAMETER location
	The name of the location containing the group
	Note: Add a backslash ‘\’ before the name of the location.

	.PARAMETER description
	The description of the group.

	.PARAMETER externalGroup
	The name of an external group that is a member in the current group.

	.EXAMPLE
	Set-PVGroup -group group1 -location \ -description "New Description"

	Sets new description on vault group 1

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
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$description,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$externalGroup
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath UPDATEGROUP $($PSBoundParameters | ConvertTo-ParameterString)

	}

}