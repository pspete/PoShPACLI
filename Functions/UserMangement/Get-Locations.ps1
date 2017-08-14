Function Get-Locations {

	<#
    .SYNOPSIS
    	Generates a list of locations, and their allocated quotas.

    .DESCRIPTION
    	Exposes the PACLI Function: "LOCATIONSLIST"

    .PARAMETER vault
       The name of the Vault in which the location is defined.

    .PARAMETER user
        The Username of the User who is carrying out the command.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli with parameters
		$Return = Invoke-PACLICommand $pacli LOCATIONSLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 4) {

					#Get Range from array
					$values = $Results[$i..($i + 4)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Name"       = $values[0]
						"Quota"      = $values[1]
						"UsedQuota"  = $values[2]
						"LocationID" = $values[3]

					}

				}

			}

		}

	}

}