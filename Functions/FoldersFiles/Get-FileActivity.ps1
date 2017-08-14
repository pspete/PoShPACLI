﻿Function Get-FileActivity {

	<#
    .SYNOPSIS
    	Inspect activity that has taken place in a specified Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "INSPECTFILE"

    .PARAMETER vault
        The name of the Vault containing the appropriate file.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe containing the file.

    .PARAMETER folder
        The folder containing the file whose activity will be listed.

    .PARAMETER file
        The name of the file or password whose activity will be listed.

    .PARAMETER logDays
        The number of days to include in the list of activities.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Get-FileActivity -vault lab -user administrator -safe PROD -folder root -file prodpass

		Lists file activity for prodpass in safe PROD

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
		[Parameter(Mandatory = $True)][string]$file,
		[Parameter(Mandatory = $False)][int]$logDays,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli INSPECTFILE "$($PSBoundParameters.getEnumerator() |
            ConvertTo-ParameterString -donotQuote logDays) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 7) {

					#Get Range from array
					$values = $Results[$i..($i + 7)]

					#Output Object
					[PSCustomObject] @{

						"Time"             = $values[0]
						"User"             = $values[1]
						"Activity"         = $values[2]
						"PreviousLocation" = $values[3]
						"RequestID"        = $values[4]
						"RequestReason"    = $values[5]
						"Code"             = $values[6]

					}

				}

			}

		}

	}

}