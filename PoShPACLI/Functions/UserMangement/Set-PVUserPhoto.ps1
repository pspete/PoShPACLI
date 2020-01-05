Function Set-PVUserPhoto {

	<#
    .SYNOPSIS
   	Saves a User’s photo in the Vault.

	.DESCRIPTION
	Exposes the PACLI Function: "PUTUSERPHOTO"

	.PARAMETER destUser
	The name of the User in the photograph.

	.PARAMETER localFolder
	The location of the folder in which the photograph is stored

	.PARAMETER localFile
	The name of the file in which the photograph is stored

	.EXAMPLE
	Set-PVUserPhoto -destUser user1 -localFolder D:\ -localFile photo.jpg

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
		[Alias("Username")]
		[string]$destUser,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFolder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFile
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath PUTUSERPHOTO $($PSBoundParameters | ConvertTo-ParameterString)



	}

}