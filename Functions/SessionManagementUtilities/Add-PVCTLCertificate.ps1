Function Add-PVCTLCertificate {

	<#
    .SYNOPSIS
    	Adds a certificate to the Certificate Trust List store.

    .DESCRIPTION
    	Exposes the PACLI Function: "CTLADDCERT"

    .PARAMETER ctlFileName
    	The name of the CTL file to the CTL store. If this parameter is not
        supplied, the CTL file name that was supplied in the INIT function
        is used.

    .PARAMETER certFileName
        The full path and name of the certificate file.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Add-PVCTLCertificate -ctlFileName CTL.FILE -certFileName cert.File

		Adds Certificate cert.File to Certificate Trust List store CTL.FILE

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $False)][string]$ctlFileName,
		[Parameter(Mandatory = $False)][string]$certFileName,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli CTLADDCERT $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Certificate $certFileName Added to CTL"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}