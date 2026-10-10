# .ExternalHelp PoShPACLI-help.xml
function Get-PVGroupMember {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Groupname')]
		[string]$group
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand GROUPMEMBERS -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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
							'Groupname' = $group
							'Username'  = $values[0]
							'UserID'    = $values[1]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Group.Member

					}

				}

			}

		}

	}

}