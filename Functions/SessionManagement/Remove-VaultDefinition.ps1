﻿Function Remove-VaultDefinition {

	<#
    .SYNOPSIS
    	Deletes a Vault definition

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEVAULT"

    .PARAMETER vault
        The name of the Vault to delete.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-VaultDefinition -vault "Demo Vault"

		Deletes "Demo Vault" vault definition.

	.NOTES
		No longer supported from version 5.5

    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $False)][string]$vault,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEVAULT $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}