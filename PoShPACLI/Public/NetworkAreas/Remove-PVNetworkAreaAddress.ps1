# .ExternalHelp PoShPACLI-help.xml
function Remove-PVNetworkAreaAddress {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ipAddress
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETEAREAADDRESS -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}