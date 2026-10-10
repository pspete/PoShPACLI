# .ExternalHelp PoShPACLI-help.xml
function Get-PVNetworkArea {

	[CmdletBinding()]
	param()

	process {

		$Return = Invoke-PACLICommand -PacliCommand NETWORKAREASLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

							'NetworkArea'   = $values[0]
							'SecurityLevel' = $values[1]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.NetworkArea

					}

				}

			}

		}

	}

}