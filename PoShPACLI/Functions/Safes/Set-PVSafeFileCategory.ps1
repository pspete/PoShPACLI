Function Set-PVSafeFileCategory {

	<#
	.SYNOPSIS
	Update an existing File Category at Safe level

	.DESCRIPTION
	Exposes the PACLI Function: "UPDATESAFEFILECATEGORY"

	.PARAMETER safe
	The Safe where the File Categories will be updated.

	.PARAMETER category
	The current name of the File Category.

	.PARAMETER categoryNewName
	The new name of the File Category.

	.PARAMETER validValues
	The valid values for the File Category.

	.PARAMETER defaultValue
	The default value for the File Category.

	.PARAMETER required
	Whether or not the File Category is a requirement when storing a file in
	the Safe.

	.EXAMPLE
	Set-PVSafeFileCategory -safe SAFEName -category criticality `
	-categoryNewName sev -validValues "1,2,3,4"

	Changes Safe File Category name from "Criticality" to "sev"

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[String]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$category,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[String]$categoryNewName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[String]$validValues,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[String]$defaultValue,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$required
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath UPDATESAFEFILECATEGORY $($PSBoundParameters | ConvertTo-ParameterString)



	}

}