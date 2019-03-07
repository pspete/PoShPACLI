Function New-PVGroup {

	<#
	.SYNOPSIS
		Adds a group to the CyberArk Vault

	.DESCRIPTION
		Exposes the PACLI Function: "ADDGROUP"

	.PARAMETER vault
		The name of the Vault to which the User has access.

	.PARAMETER user
		The Username of the User who is carrying out the command

	.PARAMETER group
		The name of the group to add.

	.PARAMETER location
		The location in which to add the group.
		Note: Add a backslash ‘\’ before the name of the location.

	.PARAMETER description
		A brief description of the group.

	.PARAMETER externalGroup
		The name of an external group that is a member in the current group.

	.PARAMETER sessionID
		The ID number of the session. Use this parameter when working
		with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
			New-PVGroup -vault Lab -user administrator -group xGroup1 -location "\" -description "test description"

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
			ValueFromPipelineByPropertyName = $False)]
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[string]$description,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[string]$externalGroup,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(Test-PACLI) {

			#$PACLI variable set to executable path

			$Return = Invoke-PACLICommand $pacli ADDGROUP $($PSBoundParameters.getEnumerator() |
					ConvertTo-ParameterString)

			if($Return.ExitCode) {

				Write-Error $Return.StdErr

			}

			elseif($Return.ExitCode -eq 0) {

				Write-Verbose "Added Group $group"

				[PSCustomObject] @{

					"Groupname" = $group
					"vault"     = $vault
					"user"      = $user
					"sessionID" = $sessionID

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI

			}

		}

	}

}