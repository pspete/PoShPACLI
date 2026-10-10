# .ExternalHelp PoShPACLI-help.xml
function Rename-PVUser {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$destUser,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newName
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand RENAMEUSER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}