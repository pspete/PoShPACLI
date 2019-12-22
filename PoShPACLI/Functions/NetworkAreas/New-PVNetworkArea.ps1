Function New-PVNetworkArea {

	<#
	.SYNOPSIS
	Adds a new Network Area to the CyberArk Vault environment.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDNETWORKAREA"

	.PARAMETER networkArea
	The name of the new Network Area.

	.PARAMETER securityLevelParm
	The level of the Network Area security flags.

	.EXAMPLE
	New-PVNetworkArea -networkArea All\EMEA

	Adds EMEA Network Area

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
			ValueFromPipelineByPropertyName = $True)]
		[ValidateRange(1, 63)]
		[int]$securityLevelParm
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath ADDNETWORKAREA $($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote securityLevelParm)

		

	}

}