Function Get-OwnerSafes {

	<#
    .SYNOPSIS
    	Lists of the Safes to which the specified Safe Owner has ownership.

    .DESCRIPTION
    	Exposes the PACLI Function: "OWNERSAFESLIST"

    .PARAMETER vault
        The name of the Vault to which the Safe Owner has access.

    .PARAMETER user
        The Username of the User carrying out the task

    .PARAMETER owner
        The name of the Safe Owner.

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
		[Parameter(Mandatory = $True)][String]$owner,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli OWNERSAFESLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 3) {

					#Get Range from array
					$values = $Results[$i..($i + 3)]

					#Output Object
					[PSCustomObject] @{

						"Name"           = $values[0]
						"AccessLevel"    = $values[1]
						"ExpirationDate" = $values[2]

					}

				}

			}

		}

	}

}