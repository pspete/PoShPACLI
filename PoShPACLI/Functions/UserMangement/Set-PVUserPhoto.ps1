Function Set-PVUserPhoto {

	<#
    .SYNOPSIS
    	Saves a User’s photo in the Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "PUTUSERPHOTO"

    .PARAMETER vault
    	The name of the Vault to which the User has access.

    .PARAMETER user
    	The Username of the User who is carrying out the command.

    .PARAMETER destUser
    	The name of the User in the photograph.

    .PARAMETER localFolder
    	The location of the folder in which the photograph is stored

    .PARAMETER localFile
    	The name of the file in which the photograph is stored

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Set-PVUserPhoto -vault Lab -user Administrator -destUser user1 -localFolder D:\ -localFile photo.jpg

		Sets D:\photo.jpg as user photo for vault user user1

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
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[string]$localFolder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[string]$localFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $pacli PUTUSERPHOTO $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "User Photo Saved to Vault"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}