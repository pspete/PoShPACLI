Function Set-PVGroup {

	<#
	.SYNOPSIS
	Updates CyberArk Group properties.

	.DESCRIPTION
	Exposes the PACLI Function: "UPDATEGROUP"

	.PARAMETER vault
    The defined Vault name

	.PARAMETER user
    The Username of the authenticated User.

	.PARAMETER group
	The name of the group to update.

	.PARAMETER location
	The name of the location containing the group
	Note: Add a backslash ‘\’ before the name of the location.

	.PARAMETER description
	The description of the group.

	.PARAMETER externalGroup
	The name of an external group that is a member in the current group.

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	Set-PVGroup -vault Lab -user administrator -group group1 -location \ -description "New Description"

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
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$description,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$externalGroup,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath UPDATEGROUP $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			

			[PSCustomObject] @{

				"Groupname" = $group
				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}