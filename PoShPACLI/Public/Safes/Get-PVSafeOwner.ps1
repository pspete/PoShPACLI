# .ExternalHelp PoShPACLI-help.xml
function Get-PVSafeOwner {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safePattern,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ownerPattern,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeGroupMembers
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand OWNERSLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

							'Username'          = $values[0]
							'Group'             = $values[1]
							'Safename'          = $values[2]
							'AccessLevel'       = $values[3]
							'OpenDate'          = $values[4]
							'OpenState'         = $values[5]
							'ExpirationDate'    = $values[6]
							'GatewayAccount'    = $values[7]
							'ReadOnlyByDefault' = $values[8]
							'SafeID'            = $values[9]
							'UserID'            = $values[10]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Owner

					}

				}

			}

		}

	}

}