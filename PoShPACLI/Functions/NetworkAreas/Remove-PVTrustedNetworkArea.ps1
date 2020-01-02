Function Remove-PVTrustedNetworkArea {

	<#
	.SYNOPSIS
	Deletes a Trusted Network Area from a CyberArk Vault environment.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETETRUSTEDNETWORKAREA"

	.PARAMETER trusterName
	The User whose access to the Trusted Network Area will be removed.

	.PARAMETER networkArea
	The name of the Trusted Network Area to delete.

	.EXAMPLE
	Remove-PVTrustedNetworkArea -trusterName cnAdmin -networkArea All\Vendor

	Deletes Trusted Network Area "Vendor" from cnAdmin account

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
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

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETETRUSTEDNETWORKAREA $($PSBoundParameters | ConvertTo-ParameterString)



	}

}