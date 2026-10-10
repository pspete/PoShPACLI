function Disable-PVTrustedNetworkArea {

	<#
	.SYNOPSIS
	Deactivates a Trusted Network Area.

	.DESCRIPTION
	Exposes the PACLI Function: "DEACTIVATETRUSTEDNETWORKAREA"

	.PARAMETER trusterName
	The User who will not have access to the Trusted Network Area.

	.PARAMETER networkArea
	The name of the Network Area to deactivate.

	.EXAMPLE
	Disable-PVTrustedNetworkArea -trusterName user2 -networkArea All

	Disables the "All" Trusted Network Area for user2

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdletBinding()]
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

		$Null = Invoke-PACLICommand -PacliCommand DEACTIVATETRUSTEDNETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}