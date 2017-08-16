Function Clear-SafeHistory {

	<#
    .SYNOPSIS
    	Clears the history of all activity in the specified open Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "CLEARSAFEHISTORY"

    .PARAMETER vault
        The name of the Vault containing the appropriate Safe.

    .PARAMETER user
        The Username of the User who is carrying out the command.

    .PARAMETER safe
        The name of the Safe to clear.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Clear-SafeHistory -vault Lab -user administrator -safe system

		Clears safe history on the SYSTEM safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][String]$safe,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli CLEARSAFEHISTORY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}