Function New-PVSafeFileCategory {

	<#
	.SYNOPSIS
	Adds File Categories at Safe level

	.DESCRIPTION
	Exposes the PACLI Function: "ADDSAFEFILECATEGORY"

	.PARAMETER safe
	The Safe where the File Category will be added.

	.PARAMETER category
	The name of the File Category.

	.PARAMETER type
	The type of File Category.
	Valid values for this parameter are:
		cat_text – a textual value
		cat_numeric – a numeric value
		cat_list – a list value

	.PARAMETER validValues
	The valid values for the File Category.

	.PARAMETER defaultValue
	The default value for the File Category.

	.PARAMETER required
	Whether or not the File Category is a requirement when storing a file in
	the Safe.

	.EXAMPLE
	New-PVSafeFileCategory -safe EU_Support -category NewCat1 -type cat_text

	Adds text type category NewCat1 to EU_Support safe

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
		[ValidateSet("cat_text", "cat_numeric", "cat_list")]
		[String]$type,

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

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDSAFEFILECATEGORY $($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote type)



	}

}