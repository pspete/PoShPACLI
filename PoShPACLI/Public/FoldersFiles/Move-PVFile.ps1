# .ExternalHelp PoShPACLI-help.xml
function Move-PVFile {

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
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Filename")]
		[string]$file,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newFolder
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand MOVEFILE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}