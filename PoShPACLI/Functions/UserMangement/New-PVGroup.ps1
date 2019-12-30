Function New-PVGroup {

	<#
	.SYNOPSIS
	Adds a group to the CyberArk Vault

	.DESCRIPTION
	Exposes the PACLI Function: "ADDGROUP"

	.PARAMETER group
	The name of the group to add.

	.PARAMETER location
	The location in which to add the group.
	Note: Add a backslash ‘\’ before the name of the location.

	.PARAMETER description
	A brief description of the group.

	.PARAMETER externalGroup
	The name of an external group that is a member in the current group.

	.EXAMPLE
		New-PVGroup -group xGroup1 -location "\" -description "test description"

		Adds group xGroup1 to vault.

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

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDGROUP $($PSBoundParameters | ConvertTo-ParameterString)

	}

}