# .ExternalHelp PoShPACLI-help.xml
function Open-PVSafe {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('REQUEST_AND_USE', 'CHECK_DONT_USE', 'USE_ONLY')]
		[string]$requestUsageType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('SINGLE', 'MULTIPLE')]
		[string]$requestAccessType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$usableFrom,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$usableTo,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$requestReason,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$useRequest,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$sendRequest,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$executeRequest
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand OPENSAFE -CommandParameters "$($PSBoundParameters |
					ConvertTo-ParameterString -donotQuote requestUsageType,requestAccessType) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				If ($Results) {

					#Output Object
					[PSCustomObject] @{

						#(possibility these may not all be in the correct order -
						#...but most are)
						'Safename'                  = $Results[0]
						'Status'                    = $Results[1]
						'LastUsed'                  = $Results[2]
						'Accessed'                  = $Results[3]
						'Size'                      = $Results[4]
						'Location'                  = $Results[5]
						'SafeID'                    = $Results[6]
						'LocationID'                = $Results[7]
						'TextOnly'                  = $Results[8]
						'ShareOptions'              = $Results[9]
						'UseFileCategories'         = $Results[10]
						'RequireContentValidation'  = $Results[11]
						'RequireReason'             = $Results[12]
						'EnforceExclusivePasswords' = $Results[13]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe

				}

			}

		}

	}

}