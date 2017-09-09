Function Get-PVCTL {

	<#
    .SYNOPSIS
    	Returns the name of the Certificate Trust List (CTL) that was defined
        during the Start-PVPacli function.

    .DESCRIPTION
    	Exposes the PACLI Function: "CTLGETFILENAME"

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVCTL

		Returns the name of the Certificate Trust List (CTL) provided to Start-PVPacli function.

    .NOTES
    	AUTHOR: Pete Maan

    #>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	If(Test-PACLI) {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli CTLGETFILENAME "$($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#Output Object
				[PSCustomObject] @{

					"CertificateTrustList" = $Results[0]

				} | Add-ObjectDetail -DefaultProperties CertificateTrustList -PropertyToAdd @{
					"sessionID" = $sessionID
				}

			}

		}

	}

}