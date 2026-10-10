# .ExternalHelp PoShPACLI-help.xml
function Remove-PVGroup {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Groupname")]
		[string]$group
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETEGROUP -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}