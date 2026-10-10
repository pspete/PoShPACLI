# .ExternalHelp PoShPACLI-help.xml
function Get-PVUserList {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeSubLocations,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeDisabledUsers,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$onlyKnownUsers,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$userPattern
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand USERSLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = @($Return.StdOut | ConvertFrom-PacliOutput)

				#if records returned
				If ($Results) {

					#loop through results
					foreach ($values in $Results) {

						#output object for each user
						[PSCustomObject] @{

							'Username'                  = $values[0]
							'Quota'                     = $values[1]
							'UsedQuota'                 = $values[2]
							'Location'                  = $values[3]
							'FirstName'                 = $values[4]
							'LastName'                  = $values[5]
							'LDAPUser'                  = $values[6]
							'Template'                  = $values[7]
							'GWAccount'                 = $values[8]
							'Disabled'                  = $values[9]
							'Type'                      = $values[10]
							'UserID'                    = $values[11]
							'LocationID'                = $values[12]
							'EnableComponentMonitoring' = $values[13]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.User

					}

				}

			}

		}

	}

}