Function New-PVLocation {

	<#
	.SYNOPSIS
	Adds a location to the Vault.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDLOCATION"

	.PARAMETER location
	The name of the location to add.
	Note: Add a backslash ‘\’ before the name of the location

	.PARAMETER quota
	The size of the quota to allocate to the location in MB.
	The specification ‘-1’ indicates an unlimited quota allocation.

	.EXAMPLE
	New-PVLocation -location \x51

	Adds location x51 to Vault root

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$quota
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDLOCATION $($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote quota)



	}

}