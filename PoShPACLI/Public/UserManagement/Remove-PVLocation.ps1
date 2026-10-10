# .ExternalHelp PoShPACLI-help.xml
function Remove-PVLocation {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETELOCATION -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}