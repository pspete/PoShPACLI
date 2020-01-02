Function Add-PVTrustedNetworkArea {

	<#
	.SYNOPSIS
	Adds a Trusted Network Area from which a CyberArk User can access the
	CyberArk Vault.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDTRUSTEDNETWORKAREA"

	.PARAMETER trusterName
	The User who will have access to the Trusted Network Area.

	.PARAMETER networkArea
	The name of the Trusted Network Area to add.

	.PARAMETER fromHour
	The time from which access to the Vault is permitted.

	.PARAMETER toHour
	The time until which access to the Vault is permitted.

	.PARAMETER maxViolationCount
	The maximum number of access violations permitted before the User is not
	permitted to access the Vault.

	.EXAMPLE
	Add-PVTrustedNetworkArea -trusterName user1 -networkArea "All\VPN"

	Adds VPN Trusted Network Area to user1

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$trusterName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$fromHour,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$toHour,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$maxViolationCount
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDTRUSTEDNETWORKAREA $($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote fromHour, toHour, maxViolationCount)



	}

}