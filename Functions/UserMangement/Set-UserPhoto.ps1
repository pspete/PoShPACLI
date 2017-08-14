﻿Function Set-UserPhoto {

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
		Set-UserPhoto -vault Lab -user Administrator -destUser user1 -localFolder D:\ -localFile photo.jpg

		Sets D:\photo.jpg as user photo for vault user user1

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$destUser,
		[Parameter(Mandatory = $True)][string]$localFolder,
		[Parameter(Mandatory = $True)][string]$localFile,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli PUTUSERPHOTO $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}