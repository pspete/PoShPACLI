Function Restore-File {

	<#
    .SYNOPSIS
    	Undelete a file or password that has been previously deleted.

    .DESCRIPTION
    	Exposes the PACLI Function: "UNDELETEFILE"

    .PARAMETER vault
        The name of the Vault in which the file was stored.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe in which the file was stored.

    .PARAMETER folder
        The name of the folder in which the file was stored.

    .PARAMETER file
        The name of the file or password to undelete.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Restore-File -vault lab -user administrator -safe US_Region -folder root -file deletedFile

		"Un-deletes"/Restores deletedFile

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$folder,
		[Parameter(Mandatory = $True)][string]$file,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli UNDELETEFILE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}