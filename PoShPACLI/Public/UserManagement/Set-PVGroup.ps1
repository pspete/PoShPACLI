# .ExternalHelp PoShPACLI-help.xml
function Set-PVGroup {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification = 'ShouldProcess handling is in Invoke-PACLICommand')]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Groupname')]
		[string]$group,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$description,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$externalGroup
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand UPDATEGROUP -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)

	}

}