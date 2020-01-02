Function Set-PVLocation {

	<#
    .SYNOPSIS
    Updates the properties of a location.

    .DESCRIPTION
    Exposes the PACLI Function: "UPDATELOCATION"

    .PARAMETER location
	The name of the location to update.
	Note: Add a backslash ‘\’ before the name of the location

    .PARAMETER quota
	The size of the quota to allocate to the location in MB.
	The specification ‘-1’ indicates an unlimited quota allocation.

    .EXAMPLE
	Set-PVLocation -location \EMEA -quota 1000

	Sets quota on EMEA

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
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$quota
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath UPDATELOCATION $($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote quota)



	}

}