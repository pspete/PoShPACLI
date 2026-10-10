# .ExternalHelp PoShPACLI-help.xml
function Get-PVCTLCertificate {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ctlFileName
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand CTLLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = @($Return.StdOut | ConvertFrom-PacliOutput)

				If ($Results) {

					#loop through results
					foreach ($values in $Results) {

						#Output Object
						[PSCustomObject] @{

							#Add elements to hashtable
							'Subject'  = $values[0]
							'Issuer'   = $values[1]
							'FromDate' = $values[2]
							'ToDate'   = $values[3]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.CTL.Certificate

					}

				}

			}

		}

	}

}