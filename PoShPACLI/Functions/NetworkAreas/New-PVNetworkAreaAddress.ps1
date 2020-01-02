Function New-PVNetworkAreaAddress {

	<#
	.SYNOPSIS
	Adds an IP address to an existing Network Area.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDAREAADDRESS"

	.PARAMETER networkArea
	The name of the Network Area to which to add an IP address

	.PARAMETER ipAddress
	The IP address to add to the Network Area.

	.PARAMETER ipMask
	The first IP address in the IP mask to add to the Network Area.

	.PARAMETER toAddress
	The final IP address in the mask of the Network Area.

	.EXAMPLE
	New-PVNetworkAreaAddress -networkArea All\EMEA -ipAddress 192.168.0.1 -toAddress 192.168.0.254

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
		[string]$networkArea,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ipAddress,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ipMask,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$toAddress
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDAREAADDRESS $($PSBoundParameters |
			ConvertTo-ParameterString -doNotQuote ipAddress, ipMask, toAddress)



	}

}