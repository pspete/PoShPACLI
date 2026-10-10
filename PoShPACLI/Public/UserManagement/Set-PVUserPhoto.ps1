# .ExternalHelp PoShPACLI-help.xml
function Set-PVUserPhoto {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$destUser,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFolder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFile
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand PUTUSERPHOTO -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}