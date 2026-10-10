# .ExternalHelp PoShPACLI-help.xml
function Remove-PVSafeFileCategory {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[String]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("CategoryName")]
		[string]$category
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETESAFEFILECATEGORY -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}