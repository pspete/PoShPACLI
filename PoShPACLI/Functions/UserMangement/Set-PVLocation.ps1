Function Set-PVLocation {

	<#
    .SYNOPSIS
    Updates the properties of a location.

    .DESCRIPTION
    Exposes the PACLI Function: "UPDATELOCATION"

    .PARAMETER vault
    The defined Vault name

	.PARAMETER user
    The Username of the authenticated User.

    .PARAMETER location
	The name of the location to update.
	Note: Add a backslash ‘\’ before the name of the location

    .PARAMETER quota
	The size of the quota to allocate to the location in MB.
	The specification ‘-1’ indicates an unlimited quota allocation.

    .PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
	Set-PVLocation -vault Lab -user administrator -location \EMEA -quota 1000

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
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$quota,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath UPDATELOCATION $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString -donotQuote quota)

		if ($Return.ExitCode -eq 0) {

			

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}