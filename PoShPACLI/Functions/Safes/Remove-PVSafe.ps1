Function Remove-PVSafe {

	<#
    .SYNOPSIS
	Delete a Safe. It is only possible to delete a Safe after the version
	retention period has expired for all files contained in the Safe.
	In order to carry out this command successfully, the Safe must be open.

    .DESCRIPTION
	Exposes the PACLI Function: "DELETESAFE"
	A deleted Safe cannot be recovered, make sure that any files that are stored
	within it are not required as they will be deleted.
	A detailed description of the function or script. This keyword can be
	used only once in each topic.

    .PARAMETER vault
    The defined Vault name

	.PARAMETER user
    The Username of the authenticated User.

    .PARAMETER safe
    The name of the Safe to delete.

    .PARAMETER sessionID
    The ID number of the session. Use this parameter when working
    with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    Remove-PVSafe -vault lab -user administrator -safe Old_Safe

	Deletes safe Old_Safe

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
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DELETESAFE $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "Deleted Safe $safe"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}