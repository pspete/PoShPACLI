# .ExternalHelp PoShPACLI-help.xml
function Get-PVUserActivity {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$logDays
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand INSPECTUSER -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString -donotQuote logDays) OUTPUT (ALL,ENCLOSE)"

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

							#assign values to properties
							'Time'          = $values[0]
							'Username'      = $values[1]
							'Safe'          = $values[2]
							'Activity'      = $values[3]
							'Location'      = $values[4]
							'NewLocation'   = $values[5]
							'RequestID'     = $values[6]
							'RequestReason' = $values[7]
							'Code'          = $values[8]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.User.Activity

					}

				}

			}

		}

	}

}