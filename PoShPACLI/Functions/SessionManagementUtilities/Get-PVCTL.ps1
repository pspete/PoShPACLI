Function Get-PVCTL {

	<#
	.SYNOPSIS
	Returns the name of the Certificate Trust List (CTL) that was defined
	during the Start-PVPacli function.

	.DESCRIPTION
	Exposes the PACLI Function: "CTLGETFILENAME"

	.EXAMPLE
	Get-PVCTL

	Returns the name of the Certificate Trust List (CTL) provided to Start-PVPacli function.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param()

	$Return = Invoke-PACLICommand $Script:PV.ClientPath CTLGETFILENAME "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

	if ($Return.ExitCode -eq 0) {

		#if result(s) returned
		if ($Return.StdOut) {

			#Convert Output to array
			$Results = $Return.StdOut | ConvertFrom-PacliOutput

			#Output Object
			[PSCustomObject] @{

				"CertificateTrustList" = $Results[0]

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI.CTL

		}

	}

}