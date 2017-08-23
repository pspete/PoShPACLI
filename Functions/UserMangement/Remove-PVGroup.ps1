Function Remove-PVGroup {

	<#
		.SYNOPSIS
			Deletes a CyberArk group from the Vault

		.DESCRIPTION
			Exposes the PACLI Function: "DELETEGROUP"

		.PARAMETER vault
		The name of the Vault containing the group.

		.PARAMETER user
		The Username of the User who is carrying out the command

		.PARAMETER group
		The name of the group to delete.

		.PARAMETER sessionID
			The ID number of the session. Use this parameter when working
				with multiple scripts simultaneously. The default is ‘0’.

		.EXAMPLE
			Remove-PVGroup -vault Lab -user administrator -group old_group

			Deletes group old_group from Vault.

		.NOTES
			AUTHOR: Pete Maan
			LASTEDIT: August 2017
		#>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$group,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEGROUP $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Deleted Group $group"

		}

	}

}