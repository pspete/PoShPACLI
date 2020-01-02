Function Move-PVFile {

	<#
	.SYNOPSIS
	Moves a file or password to a different folder within the same Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "MOVEFILE"

	.PARAMETER safe
	The name of the Safe in which the file is stored.

	.PARAMETER folder
	The name of the folder in which the file is stored.

	.PARAMETER file
	The name of the file or password to move.

	.PARAMETER newFolder
	The name of the folder into which the file will be moved.

	.EXAMPLE
	Move-PVFile -safe AuditReports -folder root -file Report1 `
	-newFolder root\reports

	Move file Report1 to Reports folder within AuditReports safe.

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
		[Alias("Filename")]
		[string]$file,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newFolder
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath MOVEFILE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}