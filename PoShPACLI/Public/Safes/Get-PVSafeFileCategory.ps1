# .ExternalHelp PoShPACLI-help.xml
function Get-PVSafeFileCategory {

	[CmdletBinding()]
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

	process {

		$Return = Invoke-PACLICommand -PacliCommand LISTSAFEFILECATEGORIES -CommandParameters "$($PSBoundParameters |
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