# .ExternalHelp PoShPACLI-help.xml
function Get-PVSafeList {

	[CmdletBinding()]
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

	process {

		$Return = Invoke-PACLICommand -PacliCommand SAFESLIST -CommandParameters "$($PSBoundParameters |
            ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

						'Safename'                  = $values[0]
						'Size'                      = $values[1]
						'Status'                    = $values[2]
						'LastUsed'                  = $values[3]
						'Accessed'                  = $values[4]
						'VirusFree'                 = $values[5]
						'ShareOptions'              = $values[6]
						'Location'                  = $values[7]
						'UseFileCategories'         = $values[8]
						'TextOnly'                  = $values[9]
						'RequireReason'             = $values[10]
						'EnforceExclusivePasswords' = $values[11]
						'RequireContentValidation'  = $values[12]
						'AccessLevel'               = $values[13]
						'MaxSize'                   = $values[14]
						'ReadOnlyByDefault'         = $values[15]
						'SafeID'                    = $values[16]
						'LocationID'                = $values[17]
						'SupportOLAC'               = $values[18]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe

				}

			}

		}

	}

}