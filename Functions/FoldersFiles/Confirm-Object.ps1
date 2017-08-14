﻿Function Confirm-Object {

	<#
    .SYNOPSIS
    	Validates a file in a Safe that requires content validation before
        users can access the objects in it.

    .DESCRIPTION
    	Exposes the PACLI Function: "VALIDATEOBJECT"

    .PARAMETER vault
        The name of the Vault in which the file is stored.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe in which the file is stored.

    .PARAMETER folder
        The name of the folder in which the file is stored.

    .PARAMETER file
        The name of the file to validate.

    .PARAMETER internalName
        The internal name of the file version to validate

    .PARAMETER validationAction
        The type of validation action that take place.
        Possible values are:
            VALID
            INVALID
            PENDING

    .PARAMETER reason
        The reason for validating the file.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Confirm-Object -vault lab -user administrator -safe Prod_Env -folder root -object Oracle-sys -internalName 000000000000011 -validationAction INVALID -reason OK -sessionID 0

		Marks specified version of Oracle-sys in Prod_Env as INVALID.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$folder,
		[Parameter(Mandatory = $True)][string]$object,
		[Parameter(Mandatory = $True)][string]$internalName,
		[Parameter(Mandatory = $True)][ValidateSet("VALID", "INVALID", "PENDING")][string]$validationAction,
		[Parameter(Mandatory = $True)][string]$reason,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli VALIDATEOBJECT $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote validationAction)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}