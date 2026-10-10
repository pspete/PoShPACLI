# .ExternalHelp PoShPACLI-help.xml
function Get-PVGroup {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Groupname')]
		[string]$group
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand GROUPDETAILS -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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
							'Groupname'     = $group
							'Description'   = $values[0]
							'LDAPFullDN'    = $values[1]
							'LDAPDirectory' = $values[2]
							'MapID'         = $values[3]
							'MapName'       = $values[4]
							'ExternalGroup' = $values[5]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Group

					}

				}

			}

		}

	}

}