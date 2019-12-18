Function Remove-PVUser {

	<#
    .SYNOPSIS
    Enables a User with the appropriate authority to delete a CyberArk User.

    .DESCRIPTION
	Exposes the PACLI Function: "DELETEUSER"

    .PARAMETER vault
    The defined Vault name

	.PARAMETER user
    The Username of the authenticated User.

    .PARAMETER destUser
    The name of the User to be deleted.

    .PARAMETER sessionID
    The ID number of the session. Use this parameter when working
    with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
	Remove-PVUser -vault Lab -user administrator -destUser quitter

	Deletes vault user "quitter"

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
		[Alias("Username")]
		[string]$destUser,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DELETEUSER $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}