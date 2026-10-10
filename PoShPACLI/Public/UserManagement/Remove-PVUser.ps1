# .ExternalHelp PoShPACLI-help.xml
function Remove-PVUser {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$destUser
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETEUSER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}