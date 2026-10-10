# .ExternalHelp PoShPACLI-help.xml
function Get-PVFile {

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
		[string]$localFolder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$lockFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$evenIfLocked,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('REQUEST_AND_USE', 'CHECK_DONT_USE', 'USE_ONLY')]
		[string]$requestUsageType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("SINGLE", "MULTIPLE")]
		[string]$requestAccessType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$usableFrom,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$usableTo,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$requestReason,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("userRequest")]
		[switch]$useRequest,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$sendRequest,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$executeRequest
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand RETRIEVEFILE -CommandParameters ($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote requestUsageType, requestAccessType)
	}

}