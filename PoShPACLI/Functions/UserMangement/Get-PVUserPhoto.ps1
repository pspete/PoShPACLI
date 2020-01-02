Function Get-PVUserPhoto {

	<#
	.SYNOPSIS
	Retrieves the photograph of the specified CyberArk User from the Vault

	.DESCRIPTION
	Exposes the PACLI Function: "GETUSERPHOTO"

	.PARAMETER destUser
	The name of the User whose photo you wish to retrieve.

	.PARAMETER localFolder
	The path of the folder in which the photograph is stored

	.PARAMETER localFile
	The name of the file in which the photograph is stored

	.EXAMPLE
	Get-PVUserPhoto -destUser user1 -localFolder D:\userphotos `
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

		$Null = Invoke-PACLICommand $Script:PV.ClientPath GETUSERPHOTO $($PSBoundParameters | ConvertTo-ParameterString)



	}

}