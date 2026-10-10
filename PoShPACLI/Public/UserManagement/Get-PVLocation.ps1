# .ExternalHelp PoShPACLI-help.xml
function Get-PVLocation {

	[CmdletBinding()]
	param()

	process {

		$Return = Invoke-PACLICommand -PacliCommand LOCATIONSLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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
							'Location'   = $values[0]
							'Quota'      = $values[1]
							'UsedQuota'  = $values[2]
							'LocationID' = $values[3]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Location

					}

				}

			}

		}

	}

}