Function Remove-PVNetworkAreaAddress {

	<#
	.SYNOPSIS
	Deletes an IP address from an existing Network Area.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEAREAADDRESS"

	.PARAMETER networkArea
	The name of the Network Area from which to delete an IP address

	.PARAMETER ipAddress
	The IP address to delete from the Network Area.

	.EXAMPLE
	Remove-PVNetworkAreaAddress -networkArea all\VPN -ipAddress 20.54.118.55

	Deletes Area address 20.54.118.55 from VPN network area

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
		[string]$ipAddress
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEAREAADDRESS $($PSBoundParameters | ConvertTo-ParameterString)



	}

}