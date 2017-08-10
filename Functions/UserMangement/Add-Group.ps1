Function Add-Group {

	<#
    .SYNOPSIS
    	Adds a group to the CyberArk Vault

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDGROUP"

    .PARAMETER vault
		The name of the Vault to which the User has access.

    .PARAMETER user
		The Username of the User who is carrying out the command

    .PARAMETER group
		The name of the group to add.

    .PARAMETER location
		The location in which to add the group.
		Note: Add a backslash ‘\’ before the name of the location.

    .PARAMETER description
		A brief description of the group.

    .PARAMETER externalGroup
		The name of an external group that is a member in the current group.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$group,
		[Parameter(Mandatory = $True)][string]$location,
		[Parameter(Mandatory = $False)][string]$description,
		[Parameter(Mandatory = $False)][string]$externalGroup,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDGROUP $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}