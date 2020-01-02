Function Remove-PVSafeGWAccount {

	<#
    .SYNOPSIS
	Removes the safe sharing feature through a specific Gateway account.
	This means that this Safe will no longer be accessible through this
	Gateway account.

    .DESCRIPTION
    Exposes the PACLI Function: "DELETESAFESHARE"

    .PARAMETER safe
	The Safe from which to remove the sharing feature.

    .PARAMETER gwAccount
	The name of the Gateway account through which the Safe will not be accessible.

    .EXAMPLE
	Remove-PVSafeGWAccount -safe xxTest -gwAccount pvwagwuser

	Deletes PVWAGWuser as a GW account on open safe xxTest

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$gwAccount
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETESAFESHARE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}