# .ExternalHelp PoShPACLI-help.xml
function Reset-PVSafe {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand RESETSAFE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}