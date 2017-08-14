﻿Function Add-ExternalUser {

	<#
    .SYNOPSIS
    	Adds a new user from an external directory

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDUPDATEEXTERNALUSERENTITY"

    .PARAMETER vault
    	The name of the Vault.

    .PARAMETER user
    	The Username of the User who is carrying out the task.

    .PARAMETER destUser
    	The name (samaccountname) of the external User or Group that will be created
        in the Vault.

    .PARAMETER ldapFullDN
    	The full DN of the user in the external directory.

    .PARAMETER ldapDirectory
    	The name of the external directory where the user or group is defined.

    .PARAMETER UpdateIfExists
    	Whether or not existing external Users and Groups definitions will be updated
        in the Vault.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Add-ExternalUser -vault Lab -user Administrator -destUser admin01 -ldapDirectory VIRTUALREAL.IT -UpdateIfExists

		Updates user admin01 in vault from domain VIRTUALREAL.IT
    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
        Work required to support LDAPFullDN & Parameter Validation / Parameter Sets
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)]
		[string]$vault,
		[Parameter(Mandatory = $True)]
		[string]$user,
		[Parameter(Mandatory = $True)]
		[string]$destUser,
		[Parameter(Mandatory = $False)]
		[string]$ldapFullDN,
		[Parameter(Mandatory = $True)]
		[string]$ldapDirectory,
		[Parameter(Mandatory = $False)]
		[switch]$UpdateIfExists,
		[Parameter(Mandatory = $False)]
		[int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path
		$Return = Invoke-PACLICommand $pacli ADDUPDATEEXTERNALUSERENTITY "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			Write-Verbose "Error Adding External User: $destUser"

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				Write-Verbose "External User $destUser added."

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#Output Object
				[PSCustomObject] @{

					"UserName" = $Results

				}

			}

		}

	}

}