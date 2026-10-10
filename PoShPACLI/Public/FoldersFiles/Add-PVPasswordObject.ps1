# .ExternalHelp PoShPACLI-help.xml
function Add-PVPasswordObject {

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
		[string]$file,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand STOREPASSWORDOBJECT -SecretParameters $PSBoundParameters -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)
	}

}