# .ExternalHelp PoShPACLI-help.xml
function Set-PVFileCategory {

	[CmdletBinding(SupportsShouldProcess)]
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

	process {

		$Null = Invoke-PACLICommand -PacliCommand UPDATEFILECATEGORY -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}