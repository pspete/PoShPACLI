Function Set-PVObjectValidation {

	<#
	.SYNOPSIS
	Validates a file in a Safe that requires content validation before
	users can access the objects in it.

	.DESCRIPTION
	Exposes the PACLI Function: "VALIDATEOBJECT"

	.PARAMETER safe
	The name of the Safe in which the file is stored.

	.PARAMETER folder
	The name of the folder in which the file is stored.

	.PARAMETER object
	The name of the file to validate.

	.PARAMETER internalName
	The internal name of the file version to validate

	.PARAMETER validationAction
	The type of validation action that take place.
	Possible values are:
		VALID
		INVALID
		PENDING

	.PARAMETER reason
	The reason for validating the file.

	.EXAMPLE
	Set-PVObjectValidation -safe Prod_Env -folder root -object Oracle-sys `
	-internalName 000000000000011 -validationAction INVALID -reason OK

	Marks specified version of Oracle-sys in Prod_Env as INVALID.

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
		[string]$object,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$internalName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("VALID", "INVALID", "PENDING")]
		[string]$validationAction,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$reason
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath VALIDATEOBJECT $($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote validationAction)



	}

}