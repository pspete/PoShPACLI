Function Update-FileCategory {

	<#
    .SYNOPSIS
    	Updates an existing File Category for a file or password.

    .DESCRIPTION
    	Exposes the PACLI Function: "UPDATEFILECATEGORY"

    .PARAMETER vault
        The name of the Vault where the File Category is being updated.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe where the File Category is being updated.

    .PARAMETER folder
        The folder containing a file with a File Category attached to it.

    .PARAMETER file
        The name of the file or password that is attached to a File Category.

    .PARAMETER category
        The name of the File Category.

    .PARAMETER value
        The value of the File Category for the file.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Update-FileCategory -vault Lab -user administrator -safe Reports -folder root -file Access -category NextReview -value 1/6/18

		Updates value of existing File Category "NextReview" on file "Access"

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$folder = "Root",
		[Parameter(Mandatory = $True)][string]$file,
		[Parameter(Mandatory = $True)][string]$category,
		[Parameter(Mandatory = $True)][string]$value,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli UPDATEFILECATEGORY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "File Category $category Updated"
			exit 0

		}

	}

}