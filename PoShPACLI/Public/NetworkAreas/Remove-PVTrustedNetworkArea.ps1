# .ExternalHelp PoShPACLI-help.xml
function Remove-PVTrustedNetworkArea {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$trusterName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETETRUSTEDNETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}