Function Move-PVNetworkArea {

	<#
	.SYNOPSIS
	Moves a Network Area to a new location in the Network Areas tree.

	.DESCRIPTION
	Exposes the PACLI Function: "MOVENETWORKAREA"

	.PARAMETER networkArea
	The name of the Network Area.

	.PARAMETER newLocation
	The new location of the Network Area.
	Note: Add a backslash ‘\’ before the name of the location.

	.EXAMPLE
	Move-PVNetworkArea -networkArea All\DE -newLocation ALL\EMEA\DE

	Moves Network Area DE to EMEA\DE

	.NOTES
	AUTHOR: Pete Maan

    #>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newLocation
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath MOVENETWORKAREA $($PSBoundParameters | ConvertTo-ParameterString)



	}

}