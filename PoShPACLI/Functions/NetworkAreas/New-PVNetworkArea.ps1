Function New-PVNetworkArea {

	<#
	.SYNOPSIS
	Adds a new Network Area to the CyberArk Vault environment.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDNETWORKAREA"

	.PARAMETER networkArea
	The name of the new Network Area.

	.PARAMETER securityLevelParm
	Specify the Network Area security flags.
	Valid values are combinations of the following:
	Locations: Internal, External, Public.
	Security Areas: HighlySecured, Secured, Unsecured

	.EXAMPLE
	New-PVNetworkArea -networkArea All\EMEA

	Adds EMEA Network Area

	.EXAMPLE
	New-PVNetworkArea -networkArea All\APAC -securityLevelParm Internal, HighlySecured

	Adds APAC Network Area with the internal & Highly Secured Network Area security flags

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
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

	PROCESS {

		If ($PSBoundParameters.ContainsKey("securityLevelParm")) {

			$PSBoundParameters["securityLevelParm"] = [int]$securityLevelParm

		}

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDNETWORKAREA $($PSBoundParameters | ConvertTo-ParameterString -donotQuote securityLevelParm)

	}


}