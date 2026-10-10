# .ExternalHelp PoShPACLI-help.xml
function Get-PVUserPhoto {

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
		[string]$localFolder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFile
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand GETUSERPHOTO -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}