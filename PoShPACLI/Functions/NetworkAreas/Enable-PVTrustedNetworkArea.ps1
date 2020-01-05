Function Enable-PVTrustedNetworkArea {

	<#
	.SYNOPSIS
	Activates a Trusted Network Area.

	.DESCRIPTION
	Exposes the PACLI Function: "ACTIVATETRUSTEDNETWORKAREA"

	.PARAMETER trusterName
	The User who will have access to the Trusted Network Area

	.PARAMETER networkArea
	The name of the Trusted Network Area to activate.

	.EXAMPLE
	Enable-PVTrustedNetworkArea -trusterName User2 -networkArea All

	Enables the "All" trusted Network Area for USer2

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
		[string]$networkArea
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ACTIVATETRUSTEDNETWORKAREA $($PSBoundParameters | ConvertTo-ParameterString)



	}

}