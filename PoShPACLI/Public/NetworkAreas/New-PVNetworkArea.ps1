# .ExternalHelp PoShPACLI-help.xml
function New-PVNetworkArea {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True
		)]
		[SecurityLevel]$securityLevelParm
	)

	process {

		If ($PSBoundParameters.ContainsKey("securityLevelParm")) {

			$PSBoundParameters["securityLevelParm"] = [int]$securityLevelParm

		}

		$Null = Invoke-PACLICommand -PacliCommand ADDNETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString -donotQuote securityLevelParm)

	}


}