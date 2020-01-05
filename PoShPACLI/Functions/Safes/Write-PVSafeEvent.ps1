Function Write-PVSafeEvent {

	<#
	.SYNOPSIS
	Adds a new application Event manually to the current Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDEVENT"

	.PARAMETER safe
	The name of the Safe where the Event is saved.

	.PARAMETER sourceID
	The unique source ID number that represents the application that
	added the Event to the Events log in the Safe.

	Note: Before adding your own type of events, contact your
	CyberArk support representative to receive a unique SourceID
	identifier.

	.PARAMETER eventTypeID
	A unique ID of the type of Event written to the Events log, specific to
	the application that carried out the event.

	.PARAMETER data
	A free text field that specifies details about the Event.

	.EXAMPLE
	Write-PVSafeEvent -safe Windows_Safe -sourceID 9999 -eventTypeID 9000 `
	-data "Event Data"

	Adds event to safe Windows_Safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
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

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDEVENT $($PSBoundParameters |

			ConvertTo-ParameterString -donotQuote sourceID, eventTypeID)



	}

}