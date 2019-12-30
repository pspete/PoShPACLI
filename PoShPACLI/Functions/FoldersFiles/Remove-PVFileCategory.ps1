Function Remove-PVFileCategory {

	<#
	.SYNOPSIS
	Deletes a category from a file or password's File Categories.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEFILECATEGORY"

	.PARAMETER safe
	The name of the Safe where the File Category is being deleted.

	.PARAMETER folder
	The folder containing a file with a File Category attached to it.

	.PARAMETER file
	The name of the file or password that is attached to a File Category.

	.PARAMETER category
	The name of the File Category.

	.EXAMPLE
	Remove-PVFileCategory -safe ORACLE -folder root -file sys.pass `
	-category AccountCategory

	Deletes AccountCategory file category from sys.pass file

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
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
		[Alias("CategoryName")]
		[string]$category
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEFILECATEGORY $($PSBoundParameters | ConvertTo-ParameterString)
	}

}