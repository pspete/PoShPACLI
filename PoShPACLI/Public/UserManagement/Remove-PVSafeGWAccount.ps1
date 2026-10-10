# .ExternalHelp PoShPACLI-help.xml
function Remove-PVSafeGWAccount {

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
		[string]$gwAccount
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETESAFESHARE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}