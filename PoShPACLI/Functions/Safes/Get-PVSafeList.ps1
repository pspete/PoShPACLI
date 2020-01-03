Function Get-PVSafeList {

	<#
	.SYNOPSIS
	Produces a list of Safes in the specified Vault

	.DESCRIPTION
	Exposes the PACLI Function: "SAFESLIST

	.PARAMETER location
	The location to search in for the Safes to include in the list.
	Note: Add a backslash ‘\’ before the name of the location.

	.PARAMETER includeSubLocations
	Whether or not in include sublocation(s) of the specified location in
	the list.

	.EXAMPLE
	Get-PVSafeList -location \

	Lists all safes from the root location of the vault

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeSubLocations
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath SAFESLIST "$($PSBoundParameters |
            ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		#if result(s) returned
		if ($Return.StdOut) {

			#Convert Output to array
			$Results = $Return.StdOut | ConvertFrom-PacliOutput

			#loop through results
			For ($i = 0 ; $i -lt $Results.length ; $i += 19) {

				#Get Range from array
				$values = $Results[$i..($i + 19)]

				#Output Object
				[PSCustomObject] @{

					"Safename"                  = $values[0]
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

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe

			}

		}

	}

}