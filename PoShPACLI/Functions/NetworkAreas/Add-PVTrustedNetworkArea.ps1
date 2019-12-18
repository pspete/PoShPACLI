Function Add-PVTrustedNetworkArea {

	<#
	.SYNOPSIS
	Adds a Trusted Network Area from which a CyberArk User can access the
	CyberArk Vault.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDTRUSTEDNETWORKAREA"

	.PARAMETER vault
	The defined Vault name

	.PARAMETER user
	The Username of the authenticated User.

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

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	Add-PVTrustedNetworkArea -vault Lab -user administrator -trusterName user1 -networkArea "All\VPN"

	Adds VPN Trusted Network Area to user1

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

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
		[int]$maxViolationCount,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath ADDTRUSTEDNETWORKAREA $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote fromHour, toHour, maxViolationCount)

		if($Return.ExitCode -eq 0) {

			

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}