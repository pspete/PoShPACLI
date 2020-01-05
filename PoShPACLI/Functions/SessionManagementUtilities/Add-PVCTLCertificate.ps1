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

	.EXAMPLE
	Add-PVCTLCertificate -ctlFileName CTL.FILE -certFileName cert.File

	Adds Certificate cert.File to Certificate Trust List store CTL.FILE

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ctlFileName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$certFileName
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath CTLADDCERT $($PSBoundParameters | ConvertTo-ParameterString)

	}

}