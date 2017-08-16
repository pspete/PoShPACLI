Function Get-SafeFileCategory {

	<#
    .SYNOPSIS
    	Lists all the File Categories that are available in the specified Safe

    .DESCRIPTION
    	Exposes the PACLI Function: "LISTSAFEFILECATEGORIES"

    .PARAMETER vault
        The name of the Vault containing the Safe where the File Category is
        defined.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The Safe where the File Categories is defined.

    .PARAMETER category
        The name of the File Category to list.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Get-SafeFileCategory -vault lab -user administrator -safe ORACLE -category CISOcat1

		lists specific file category details

    .EXAMPLE
    	Get-SafeFileCategory -vault lab -user administrator -safe ORACLE

		lists all file category details

	.NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $False)][string]$safe,
		[Parameter(Mandatory = $False)][string]$category,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli LISTSAFEFILECATEGORIES "$($PSBoundParameters.getEnumerator() |
            ConvertTo-ParameterString) output (ALL,ENCLOSE)"

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

					"CategoryID"           = $values[0]
					"CategoryName"         = $values[1]
					"CategoryType"         = $values[2]
					"CategoryValidValues"  = $values[3]
					"CategoryDefaultValue" = $values[4]
					"CategoryRequired"     = $values[5]
					"VaultCategory"        = $values[6]

				}

			}

		}

	}

}