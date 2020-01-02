Function Rename-PVLocation {

	<#
    .SYNOPSIS
    Renames a Location.

    .DESCRIPTION
    Exposes the PACLI Function: "RENAMELOCATION"

    .PARAMETER location
	The current name of the Location to rename.
	Note: Add a backslash ‘\’ before the name of the location

    .PARAMETER newName
	The new name of the Location.

    .EXAMPLE
	Rename-PVLocation -location \Location2 -newName \Location3

	Renames Location2 to Location3 in the vault

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newName
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath RENAMELOCATION $($PSBoundParameters | ConvertTo-ParameterString)



	}

}