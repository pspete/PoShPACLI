﻿Function Read-VaultConfigFile {

	<#
    .SYNOPSIS
    	Defines a new Vault with parameters that reside in a text file.

    .DESCRIPTION
    	Exposes the PACLI Function: "DEFINEFROMFILE"

    .PARAMETER parmFile
        The full pathname of the file containing the parameters for
        defining the Vault.

    .PARAMETER vault
        The name of the Vault to create. This name can also be
        specified in the text file, although specifying it in this command
        overrides the Vault name in the file.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Read-VaultConfigFile -parmFile D:\PACLI\Vault.ini -vault "Demo Vault"

		Defines a new vault connection using the details specified in the Vault.ini parameter file.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$parmFile,
		[Parameter(Mandatory = $False)][string]$vault,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		Write-Verbose "Defining Vault"

		$Return = Invoke-PACLICommand $pacli DEFINEFROMFILE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			Write-Verbose "Vault Config Read"
			$TRUE

		}

	}

}