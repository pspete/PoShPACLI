Function Move-PVFolder {

	<#
	.SYNOPSIS
	Moves a folder to a different location within the same Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "MOVEFOLDER"

	.PARAMETER safe
	The name of the Safe containing the folder to move.

	.PARAMETER folder
	The name of the folder.

	.PARAMETER newLocation
	The new location of the folder.
	Note: Add a backslash ‘\’ before the name of the location.

	.EXAMPLE
	Move-PVFolder -safe ComplianceReports -folder root\reports\2017 `
	-newLocation root

	Moves folder "2017"to the root location of the safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newLocation
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath MOVEFOLDER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}