Function New-PVLocation {

	<#
    .SYNOPSIS
    	Adds a location to the Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDLOCATION"

    .PARAMETER vault
        The name of the Vault to which the User has access.

    .PARAMETER user
        The Username of the User who is carrying out the command.

    .PARAMETER location
        The name of the location to add.
        Note: Add a backslash ‘\’ before the name of the location

    .PARAMETER quota
        The size of the quota to allocate to the location in MB.
        The specification ‘-1’ indicates an unlimited quota allocation.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		New-PVLocation -vault Lab -user administrator -location \x51

		Adds location x51 to Vault root

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$location,
		[Parameter(Mandatory = $False)][int]$quota,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDLOCATION $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote quota)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Added Location $location"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}