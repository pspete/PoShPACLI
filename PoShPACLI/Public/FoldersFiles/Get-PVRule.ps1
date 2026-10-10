# .ExternalHelp PoShPACLI-help.xml
function Get-PVRule {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$safeName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fullObjectname,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$isFolder
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand RULESLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

							'RuleID'           = $values[0]
							'Username'         = $values[1]
							'Safename'         = $values[2]
							'FullObjectName'   = $values[3]
							'Effect'           = $values[4]
							'RuleCreationDate' = $values[5]
							'AccessLevel'      = $values[6]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Rule

					}

				}

			}

		}

	}

}