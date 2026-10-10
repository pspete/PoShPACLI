Function Get-PVSafeFileCategory {

	<#
	.SYNOPSIS
	Lists all the File Categories that are available in the specified Safe

	.DESCRIPTION
	Exposes the PACLI Function: "LISTSAFEFILECATEGORIES"

	.PARAMETER safe
	The Safe where the File Categories is defined.

	.PARAMETER category
	The name of the File Category to list.

	.EXAMPLE
	Get-PVSafeFileCategory -safe ORACLE -category CISOcat1

	lists specific file category details

	.EXAMPLE
	Get-PVSafeFileCategory -safe ORACLE

	lists all file category details

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$category
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath LISTSAFEFILECATEGORIES "$($PSBoundParameters |
            ConvertTo-ParameterString) output (ALL,ENCLOSE)"

		#if result(s) returned
		if ($Return.StdOut) {

			#Convert Output to array
			$Results = @($Return.StdOut | ConvertFrom-PacliOutput)

			#if records returned
			If ($Results) {

				#loop through results
				foreach ($values in $Results) {

					#Output Object
					[PSCustomObject] @{

						'CategoryID'           = $values[0]
						'CategoryName'         = $values[1]
						'CategoryType'         = $values[2]
						'CategoryValidValues'  = $values[3]
						'CategoryDefaultValue' = $values[4]
						'CategoryRequired'     = $values[5]
						'VaultCategory'        = $values[6]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.FileCategory

				}

			}

		}

	}

}