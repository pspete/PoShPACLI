Function Remove-PVUser {

	<#
    .SYNOPSIS
    	Enables a User with the appropriate authority to delete a CyberArk User.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEUSER"

    .PARAMETER vault
    	The name of the Vault.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER destUser
    	The name of the User to be deleted.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVUser -vault Lab -user administrator -destUser quitter

		Deletes vault user "quitter"

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$destUser,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEUSER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Deleted User $destUser"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}