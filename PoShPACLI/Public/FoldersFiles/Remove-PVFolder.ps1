# .ExternalHelp PoShPACLI-help.xml
function Remove-PVFolder {

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
		[string]$folder
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETEFOLDER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}