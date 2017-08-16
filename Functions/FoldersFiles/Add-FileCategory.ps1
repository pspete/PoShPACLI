Function Add-FileCategory {

	<#
    .SYNOPSIS
    	Adds a predefined File Category at Vault or Safe level to a file.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDFILECATEGORY"

    .PARAMETER vault
        The name of the Vault that the File Category is being added to.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe that the File Category is being added to.

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
		Add-FileCategory -vault Lab -user administrator -safe DEV -folder Root -file SYSPass -category Criticality -value 7

		Adds predefined file category Criticality, with a value of 7 to file SYSPass in safe DEV

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $False)][string]$vault,
		[Parameter(Mandatory = $False)][string]$user,
		[Parameter(Mandatory = $False)][string]$safe,
		[Parameter(Mandatory = $False)][string]$folder,
		[Parameter(Mandatory = $False)][string]$file,
		[Parameter(Mandatory = $False)][string]$category,
		[Parameter(Mandatory = $False)][string]$value,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDFILECATEGORY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}