﻿Function Get-Safe {

	<#
    .SYNOPSIS
    	Produces a list of Safes in the specified Vault

    .DESCRIPTION
    	Exposes the PACLI Function: "SAFESLIST

    .PARAMETER vault
        The name of the Vault containing the Safes to list.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER location
        The location to search in for the Safes to include in the list.
        Note: Add a backslash ‘\’ before the name of the location.

    .PARAMETER includeSubLocations
        Whether or not in include sublocation(s) of the specified location in
        the list.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		get-safe -vault lab -user administrator -location \

		Lists all safes from the root location of the vault

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $False)][string]$location,
		[Parameter(Mandatory = $False)][switch]$includeSubLocations,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli SAFESLIST "$($PSBoundParameters.getEnumerator() |
            ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)" -DoNotWait

		#if result(s) returned
		if($Return.StdOut) {

			#Convert Output to array
			$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

			#loop through results
			For($i = 0 ; $i -lt $Results.length ; $i += 19) {

				#Get Range from array
				$values = $Results[$i..($i + 19)]

				#Output Object
				[PSCustomObject] @{

					"Name"                      = $values[0]
					"Size"                      = $values[1]
					"Status"                    = $values[2]
					"LastUsed"                  = $values[3]
					"Accessed"                  = $values[4]
					"VirusFree"                 = $values[5]
					"ShareOptions"              = $values[6]
					"Location"                  = $values[7]
					"UseFileCategories"         = $values[8]
					"TextOnly"                  = $values[9]
					"RequireReason"             = $values[10]
					"EnforceExclusivePasswords" = $values[11]
					"RequireContentValidation"  = $values[12]
					"AccessLevel"               = $values[13]
					"MaxSize"                   = $values[14]
					"ReadOnlyByDefault"         = $values[15]
					"SafeID"                    = $values[16]
					"LocationID"                = $values[17]
					"SupportOLAC"               = $values[18]

				}

			}

		}

	}

}