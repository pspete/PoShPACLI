# .ExternalHelp PoShPACLI-help.xml
function Add-PVPreferredFolder {

	[CmdletBinding()]
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

		$Null = Invoke-PACLICommand -PacliCommand ADDPREFERREDFOLDER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)
	}

}