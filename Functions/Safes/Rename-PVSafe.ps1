Function Rename-PVSafe {

	<#
    .SYNOPSIS
    	Renames a Safe

    .DESCRIPTION
    	Exposes the PACLI Function: "RENAMESAFE"

    .PARAMETER vault
        The name of the Vault containing the Safe

    .PARAMETER user
        The Username of the User carrying out the task

    .PARAMETER safe
        The current name of the Safe.

    .PARAMETER newName
        The new name of the Safe.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Rename-PVSafe -vault lab -user administrator -safe oldName -newName newName

		Renames safe oldName to newName
    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(

		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Alias("Name")][Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$newName,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID

	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli RENAMESAFE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Safe Renamed to $newName"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}