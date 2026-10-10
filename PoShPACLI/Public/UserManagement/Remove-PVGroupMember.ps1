# .ExternalHelp PoShPACLI-help.xml
function Remove-PVGroupMember {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Groupname")]
		[string]$group,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$member
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETEGROUPMEMBER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}