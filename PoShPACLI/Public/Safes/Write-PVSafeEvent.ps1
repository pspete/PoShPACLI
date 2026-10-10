# .ExternalHelp PoShPACLI-help.xml
function Write-PVSafeEvent {

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
		[String]$sourceID,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[String]$eventTypeID,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[String]$data
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand ADDEVENT -CommandParameters ($PSBoundParameters |

			ConvertTo-ParameterString -donotQuote sourceID, eventTypeID)



	}

}