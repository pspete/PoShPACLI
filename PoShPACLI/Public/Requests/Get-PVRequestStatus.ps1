# .ExternalHelp PoShPACLI-help.xml
function Get-PVRequestStatus {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$requestID
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand REQUESTCONFIRMATIONSTATUS -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString -doNotQuote requestID) OUTPUT (ALL,ENCLOSE)"

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

							'UserName'   = $values[0]
							'Groupname'  = $values[1]
							'Action'     = $values[2]
							'ActionDate' = $values[3]
							'Reason'     = $values[4]
							'UserID'     = $values[5]
							'GroupID'    = $values[6]
							'RequestID'  = $requestID
							'Safename'   = $safe

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Request.Status

					}

				}

			}

		}

	}

}