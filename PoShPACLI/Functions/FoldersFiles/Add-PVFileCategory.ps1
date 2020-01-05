Function Add-PVFileCategory {

	<#
	.SYNOPSIS
	Adds a predefined File Category at Vault or Safe level to a file.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDFILECATEGORY"

	.PARAMETER safe
	The name of the Safe that the File Category is being added to.

	.PARAMETER folder
	The folder containing a file with a File Category attached to it.

	.PARAMETER file
	The name of the file or password that is attached to a File Category.

	.PARAMETER category
	The name of the File Category.

	.PARAMETER value
	The value of the File Category for the file.

	.EXAMPLE
	Add-PVFileCategory -safe DEV -folder Root -file SYSPass `
	-category Criticality -value 7

	Adds predefined file category Criticality, with a value of 7 to file SYSPass in safe DEV

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
		[string]$category,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$value
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDFILECATEGORY $($PSBoundParameters | ConvertTo-ParameterString)



	}

}