# .ExternalHelp PoShPACLI-help.xml
function Get-PVSafe {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand SAFEDETAILS -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE,OEM)"

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

							'Safename'                  = $safe
							'Description'               = $values[0]
							'Delay'                     = $values[1]
							'Retention'                 = $values[2]
							'ObjectsRetention'          = $values[3]
							'MaxSize'                   = $values[4]
							'CurrSize'                  = $values[5]
							'FromHour'                  = $values[6]
							'ToHour'                    = $values[7]
							'DailyVersions'             = $values[8]
							'MonthlyVersions'           = $values[9]
							'YearlyVersions'            = $values[10]
							'QuotaOwner'                = $values[11]
							'Location'                  = $values[12]
							'RequestsRetention'         = $values[13]
							'ConfirmationType'          = $values[14]
							'SecurityLevel'             = $values[15]
							'DefaultAccessMarks'        = $values[16]
							'ReadOnlyByDefault'         = $values[17]
							'UseFileCategories'         = $values[18]
							'VirusFree'                 = $values[19]
							'TextOnly'                  = $values[20]
							'RequireReason'             = $values[21]
							'EnforceExclusivePasswords' = $values[22]
							'RequireContentValidation'  = $values[23]
							'ShareOptions'              = $values[24]
							'ConfirmationCount'         = $values[25]
							'MaxFileSize'               = $values[26]
							'AllowedFileTypes'          = $values[27]
							'SupportOLAC'               = $values[28]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe

					}

				}

			}

		}

	}

}