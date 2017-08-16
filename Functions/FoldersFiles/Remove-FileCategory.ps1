Function Remove-FileCategory {

	<#
    .SYNOPSIS
    	Deletes a category from a file or password's File Categories.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEFILECATEGORY"

    .PARAMETER vault
        The name of the Vault where the File Category is being deleted.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe where the File Category is being deleted.

    .PARAMETER folder
        The folder containing a file with a File Category attached to it.

    .PARAMETER file
        The name of the file or password that is attached to a File Category.

    .PARAMETER category
        The name of the File Category.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Remove-FileCategory -vault lab -user administrator -safe ORACLE -folder root -file sys.pass -category AccountCategory

		Deletes AccountCategory file category from sys.pass file

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
		[Parameter(Mandatory = $True)][string]$category,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEFILECATEGORY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}