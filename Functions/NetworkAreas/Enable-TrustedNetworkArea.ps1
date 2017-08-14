﻿Function Enable-TrustedNetworkArea {

	<#
    .SYNOPSIS
    	Activates a Trusted Network Area.

    .DESCRIPTION
    	Exposes the PACLI Function: "ACTIVATETRUSTEDNETWORKAREA"

    .PARAMETER vault
	   The name of the Vault in which the Trusted Network Area is defined.

    .PARAMETER user
	   The name of the User carrying out the task.

    .PARAMETER trusterName
	   The User who will have access to the Trusted Network Area

    .PARAMETER networkArea
	   The name of the Trusted Network Area to activate.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Enable-TrustedNetworkArea -vault lab -user administrator -trusterName User2 -networkArea All

		Enables the "All" trusted Network Area for USer2

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$trusterName,
		[Parameter(Mandatory = $True)][string]$networkArea,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ACTIVATETRUSTEDNETWORKAREA $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}