Function Get-PVCTLCertificate {

	<#
	.SYNOPSIS
	Lists all the certificates in the Certificate Trust List store.

	.DESCRIPTION
	Exposes the PACLI Function: "CTLLIST"

	.PARAMETER ctlFileName
	The name of the CTL file that contains the certificates to list. If this
	parameter is not supplied, the CTL file name that was supplied in
	the INIT function is used.

	.EXAMPLE
	Get-PVCTLCertificate

	lists all the certificates in the Certificate Trust List store/file
	using the CTL file provided as parameter value to Start-PVPacli function.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ctlFileName
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath CTLLIST "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 3) {

					#Get Range from array
					$values = $Results[$i..($i + 3)]

					#Output Object
					[PSCustomObject] @{

						#Add elements to hashtable
						"Subject"  = $values[0]
						"Issuer"   = $values[1]
						"FromDate" = $values[2]
						"ToDate"   = $values[3]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.CTL.Certificate

				}

			}

		}

	}

}