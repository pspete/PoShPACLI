# .ExternalHelp PoShPACLI-help.xml
function Get-PVSafeActivity {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safePattern,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Username')]
		[string]$userPattern,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$logdays,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$alertsOnly,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fileName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$codes,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[datetime]$fromDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[datetime]$toDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$requestID,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$categoriesNames,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$categoriesValues,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$categoriesSeperator,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('OR', 'AND')]
		[string]$categoryFilterType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$maxRecords,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$userType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('1', '2', '4', '16', '32', '64', '128', '256')]
		[int]$options
	)

	process {

		('fromDate', 'toDate') | ForEach-Object {

			if ($PSBoundParameters.ContainsKey($_)) {

				$PSBoundParameters[$_] = (Get-Date $($PSBoundParameters[$_]) -Format dd/MM/yyyy)

			}

		}

		$Return = Invoke-PACLICommand -PacliCommand INSPECTSAFE -CommandParameters "$($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote logdays,categoryFilterType,maxRecords,options) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

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

							'Time'          = $values[0]
							'Username'      = $values[1]
							'Safe'          = $values[2]
							'Activity'      = $values[3]
							'Location'      = $values[4]
							'NewLocation'   = $values[5]
							'RequestID'     = $values[6]
							'RequestReason' = $values[7]
							'Code'          = $values[8]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Activity

					}

				}

			}

		}

	}

}