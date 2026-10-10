# .ExternalHelp PoShPACLI-help.xml
function Get-PVUserSafeList {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Username')]
		[String]$owner
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand OWNERSAFESLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

							'Safename'       = $values[0]
							'AccessLevel'    = $values[1]
							'ExpirationDate' = $values[2]
							'Username'       = $owner

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.User.Safe

					}

				}

			}

		}

	}

}