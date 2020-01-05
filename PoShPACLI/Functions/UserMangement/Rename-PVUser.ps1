Function Rename-PVUser {

	<#
    .SYNOPSIS
   	Renames a CyberArk User

    .DESCRIPTION
   	Exposes the PACLI Function: "RENAMEUSER"

    .PARAMETER destUser
	The current name of the User to rename.

    .PARAMETER newName
	The new name of the User.

    .EXAMPLE
	Rename-PVUser -destUser Then -newName Now

	Renames user "Then" to user "Now"

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
		[string]$newName
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath RENAMEUSER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}