Function Move-PVNetworkArea {

	<#
    .SYNOPSIS
    	Moves a Network Area to a new location in the Network Areas tree.

    .DESCRIPTION
    	Exposes the PACLI Function: "MOVENETWORKAREA"

    .PARAMETER vault
        The name of the Vault to which the Network Area will be added.

    .PARAMETER user
        The name of the User carrying out the task.

    .PARAMETER networkArea
        The name of the Network Area.

    .PARAMETER newLocation
        The new location of the Network Area.
        Note: Add a backslash ‘\’ before the name of the location.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Move-PVNetworkArea -vault Lab -user administrator -networkArea All\DE -newLocation ALL\EMEA\DE

		Moves Network Area DE to EMEA\DE

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$networkArea,
		[Parameter(Mandatory = $True)][string]$newLocation,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli MOVENETWORKAREA $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Network Area $networkArea Moved to $newLocation"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}