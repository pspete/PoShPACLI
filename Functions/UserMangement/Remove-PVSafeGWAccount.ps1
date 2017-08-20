Function Remove-PVSafeGWAccount {

	<#
    .SYNOPSIS
    	Removes the safe sharing feature through a specific Gateway account.
        This means that this Safe will no longer be accessible through this
        Gateway account.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETESAFESHARE"

    .PARAMETER vault
	   The Vault containing the shared Safe.

    .PARAMETER user
	   The Username of the User carrying out the task.

    .PARAMETER safe
	   The Safe from which to remove the sharing feature.

    .PARAMETER gwAccount
	   The name of the Gateway account through which the Safe will not be accessible.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVSafeGWAccount -vault Lab -user administrator -safe xxTest -gwAccount pvwagwuser

		Deletes PVWAGWuser as a GW account on open safe xxTest

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$gwAccount,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETESAFESHARE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "$safe Share via $gwAccount Deleted"
			exit 0

		}

	}

}