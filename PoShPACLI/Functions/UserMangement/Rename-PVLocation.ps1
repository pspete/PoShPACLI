Function Rename-PVLocation {

	<#
    .SYNOPSIS
    Renames a Location.

    .DESCRIPTION
    Exposes the PACLI Function: "RENAMELOCATION"

    .PARAMETER vault
	The defined Vault name

	.PARAMETER user
	The Username of the authenticated User.

    .PARAMETER location
	The current name of the Location to rename.
	Note: Add a backslash ‘\’ before the name of the location

    .PARAMETER newName
	The new name of the Location.

    .PARAMETER sessionID
    The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
	Rename-PVLocation -vault Lab -user administrator -location \Location2 -newName \Location3

	Renames Location2 to Location3 in the vault

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath RENAMELOCATION $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}