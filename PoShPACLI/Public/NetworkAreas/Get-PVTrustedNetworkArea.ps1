# .ExternalHelp PoShPACLI-help.xml
function Get-PVTrustedNetworkArea {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Username')]
		[string]$trusterName
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand TRUSTEDNETWORKAREASLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

							'NetworkArea'       = $values[0]
							'FromHour'          = $values[1]
							'ToHour'            = $values[2]
							'Active'            = $values[3]
							'MaxViolationCount' = $values[4]
							'ViolationCount'    = $values[5]
							'Username'          = $trusterName

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.NetworkArea.Trusted

					}

				}

			}

		}

	}

}