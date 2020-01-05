Function Set-PVFileCategory {

	<#
	.SYNOPSIS
	Updates an existing File Category for a file or password.

	.DESCRIPTION
	Exposes the PACLI Function: "UPDATEFILECATEGORY"

	.PARAMETER safe
	The name of the Safe where the File Category is being updated.

	.PARAMETER folder
	The folder containing a file with a File Category attached to it.

	.PARAMETER file
	The name of the file or password that is attached to a File Category.

	.PARAMETER category
	The name of the File Category.

	.PARAMETER value
	The value of the File Category for the file.

	.EXAMPLE
	Set-PVFileCategory -safe Reports -folder root -file Access `
	-category NextReview -value 1/6/18

	Updates value of existing File Category "NextReview" on file "Access"

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
		[string]$category,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("CategoryValue")]
		[string]$value
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath UPDATEFILECATEGORY $($PSBoundParameters | ConvertTo-ParameterString)



	}

}