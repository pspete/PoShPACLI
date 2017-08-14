Function Move-Folder {

	<#
    .SYNOPSIS
    	Moves a folder to a different location within the same Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "MOVEFOLDER"

    .PARAMETER vault
        The name of the Vault in which the folder is located.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe containing the folder to move.

    .PARAMETER folder
        The name of the folder.

    .PARAMETER newLocation
        The new location of the folder.
        Note: Add a backslash ‘\’ before the name of the location.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Move-Folder -vault lab -user administrator -safe ComplianceReports -folder root\reports\2017 -newLocation root

		Moves folder "2017"to the root location of the safe

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
		[Parameter(Mandatory = $True)][string]$newLocation,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli MOVEFOLDER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}