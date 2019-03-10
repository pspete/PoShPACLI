Function New-PVNetworkAreaAddress {

	<#
	.SYNOPSIS
	Adds an IP address to an existing Network Area.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDAREAADDRESS"

	.PARAMETER vault
	The defined Vault name

	.PARAMETER user
	The Username of the authenticated User.

	.PARAMETER networkArea
	The name of the Network Area to which to add an IP address

	.PARAMETER ipAddress
	The IP address to add to the Network Area.

	.PARAMETER ipMask
	The first IP address in the IP mask to add to the Network Area.

	.PARAMETER toAddress
	The final IP address in the mask of the Network Area.

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	New-PVNetworkAreaAddress -vault Lab -user administrator -networkArea All\EMEA -ipAddress 192.168.0.1 -toAddress 192.168.0.254

	Adds address range to EMEA Network Area

	.NOTES
	AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
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
		[string]$networkArea,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[string]$ipAddress,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[string]$ipMask,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[string]$toAddress,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath ADDAREAADDRESS $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -doNotQuote ipAddress, ipMask, toAddress)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "Address Added to Network Area $networkArea"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}