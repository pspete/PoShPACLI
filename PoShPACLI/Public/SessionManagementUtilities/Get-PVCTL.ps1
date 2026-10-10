# .ExternalHelp PoShPACLI-help.xml
function Get-PVCTL {

	[CmdletBinding()]
	param()

	$Return = Invoke-PACLICommand -PacliCommand CTLGETFILENAME -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser) OUTPUT (ALL,ENCLOSE)"

	if ($Return.ExitCode -eq 0) {

		#if result(s) returned
		if ($Return.StdOut) {

			#Convert Output to array
			$Results = $Return.StdOut | ConvertFrom-PacliOutput

			If ($Results) {

				#Output Object
				[PSCustomObject] @{

					'CertificateTrustList' = $Results[0]

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI.CTL

			}

		}

	}

}