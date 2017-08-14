﻿Function Rename-Location {

	<#
    .SYNOPSIS
    	Renames a Location.

    .DESCRIPTION
    	Exposes the PACLI Function: "RENAMELOCATION"

    .PARAMETER vault
        The name of the Vault to which the User has access.

    .PARAMETER user
        The Username of the User who is carrying out the command.

    .PARAMETER location
        The current name of the Location to rename.
        Note: Add a backslash ‘\’ before the name of the location

    .PARAMETER newName
        The new name of the Location.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Rename-Location -vault Lab -user administrator -location \Location2 -newName \Location3

		Renames Location2 to Location3 in the vault

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$location,
		[Parameter(Mandatory = $True)][string]$newName,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli RENAMELOCATION $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}