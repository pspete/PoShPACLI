Function Remove-PVSafeGWAccount {

	<#
    .SYNOPSIS
    	Removes the safe sharing feature through a specific Gateway account.
        This means that this Safe will no longer be accessible through this
        Gateway account.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETESAFESHARE"

    .PARAMETER vault
	   The Vault containing the shared Safe.

    .PARAMETER user
	   The Username of the User carrying out the task.

    .PARAMETER safe
	   The Safe from which to remove the sharing feature.

    .PARAMETER gwAccount
	   The name of the Gateway account through which the Safe will not be accessible.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVSafeGWAccount -vault Lab -user administrator -safe xxTest -gwAccount pvwagwuser

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
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[string]$gwAccount,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DELETESAFESHARE $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "$safe Share via $gwAccount Deleted"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}