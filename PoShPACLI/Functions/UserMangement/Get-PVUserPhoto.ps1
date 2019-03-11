Function Get-PVUserPhoto {

	<#
	.SYNOPSIS
	Retrieves the photograph of the specified CyberArk User from the Vault

	.DESCRIPTION
	Exposes the PACLI Function: "GETUSERPHOTO"

	.PARAMETER vault
	The defined Vault name

	.PARAMETER user
	The Username of the authenticated User.

	.PARAMETER destUser
	The name of the User whose photo you wish to retrieve.

	.PARAMETER localFolder
	The path of the folder in which the photograph is stored

	.PARAMETER localFile
	The name of the file in which the photograph is stored

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	Get-PVUserPhoto -vault Lab -user administrator -destUser user1 -localFolder D:\userphotos `
	-localFile userphoto.jpg

	Saves photo set on user account user1 to local drive

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
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
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFolder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath GETUSERPHOTO $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "User Photo Retrieved"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}