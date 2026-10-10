# .ExternalHelp PoShPACLI-help.xml
function Get-PVSafeLog {

	[CmdletBinding()]
	param()

	process {

		$Return = Invoke-PACLICommand -PacliCommand SAFESLOG -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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
							'Safename'   = $values[0]
							'UsersCount' = $values[1]
							'OpenDate'   = $values[2]
							'OpenState'  = $values[3]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Log

					}

				}

			}

		}

	}

}