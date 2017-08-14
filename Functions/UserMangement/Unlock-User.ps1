﻿Function Unlock-User {

	<#
    .SYNOPSIS
    	Unlocks the User account of the CyberArk User who is currently logged on.

    .DESCRIPTION
    	Exposes the PACLI Function: "UNLOCK"

    .PARAMETER vault
        The name of the Vault to which the User is logged on.

    .PARAMETER user
        The Username of the User whose account is locked

    .PARAMETER password
        The User’s password

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Unlock-User -vault Lab -user administrator -password (read-host -AsSecureString)

		Unlocks the current user (administrator), after supplying password for the account.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $False)][securestring]$password,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#deal with password SecureString
		if($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		$Return = Invoke-PACLICommand $pacli UNLOCK $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}