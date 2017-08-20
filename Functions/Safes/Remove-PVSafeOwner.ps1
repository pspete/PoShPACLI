Function Remove-PVSafeOwner {

	<#
    .SYNOPSIS
    	Deletes a Safe Owner, thus removing their permissions and authority to
        enter the Safe.
        In order to carry out this command successfully, the Safe must be open.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEOWNER"

    .PARAMETER vault
        The name of the Vault to which the Safe Owner has access.

    .PARAMETER user
        The Username of the User carrying out the task

    .PARAMETER owner
        The name of the Safe Owner to remove from the Vault.

    .PARAMETER safe
        The name of the Safe from which to remove the Safe Owner.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVSafeOwner -vault lab -user administrator -safe EU_Safe -owner user1

		Deletes user1 as a safe member on EU_Safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][String]$safe,
		[Parameter(Mandatory = $True)][String]$owner,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEOWNER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}