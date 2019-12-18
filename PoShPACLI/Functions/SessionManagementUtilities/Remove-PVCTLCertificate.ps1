Function Remove-PVCTLCertificate {

	<#
	.SYNOPSIS
	Removes a certificate from the Certificate Trust List store.

	.DESCRIPTION
	Exposes the PACLI Function: "CTLREMOVECERT"

	.PARAMETER ctlFileName
	The name of the CTL file to remove from the CTL store. If this
	parameter is not supplied, the CTL file name that was supplied in
	the INIT function is used.

	.PARAMETER certFileName
	The full path and name of the certificate file.

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	Remove-PVCTLCertificate -ctlFileName CTL.FILE -certFileName cert.File

	Deletes Certificate cert.File from Certificate Trust List store CTL.FILE

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ctlFileName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$certFileName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath CTLREMOVECERT $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			[PSCustomObject] @{

				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}