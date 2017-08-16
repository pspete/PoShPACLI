Function Rename-NetworkArea {

	<#
    .SYNOPSIS
    	Renames an existing Network Area.

    .DESCRIPTION
    	Exposes the PACLI Function: "RENAMENETWORKAREA"

    .PARAMETER vault
        The name of the Vault to which the Network Area will be added.

    .PARAMETER user
        The name of the User carrying out the task.

    .PARAMETER networkArea
        The name of the Network Area.

    .PARAMETER newName
        The new name of the Network Area.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Rename-NetworkArea -vault lab -user administrator -networkArea All\EMEA -newName All\EU

		Renames network area EMEA to EU

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$networkArea,
		[Parameter(Mandatory = $True)][string]$newName,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli RENAMENETWORKAREA $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}