# .ExternalHelp PoShPACLI-help.xml
function Add-PVCTLCertificate {

	[CmdletBinding()]
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

	process {

		$Null = Invoke-PACLICommand -PacliCommand CTLADDCERT -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser)

	}

}