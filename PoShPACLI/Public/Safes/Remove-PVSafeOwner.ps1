# .ExternalHelp PoShPACLI-help.xml
function Remove-PVSafeOwner {

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
		[Alias("Username")]
		[String]$owner
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETEOWNER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}