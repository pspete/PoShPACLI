Function Write-PVSafeEvent {

	<#
	.SYNOPSIS
	Adds a new application Event manually to the current Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDEVENT"

	.PARAMETER vault
	The defined Vault name

	.PARAMETER user
	The Username of the authenticated User.

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

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	Write-PVSafeEvent -vault Lab -user administrator -safe Windows_Safe -sourceID 9999 -eventTypeID 9000 `
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
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[String]$sourceID,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[String]$eventTypeID,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[String]$data,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath ADDEVENT $($PSBoundParameters |

			ConvertTo-ParameterString -donotQuote sourceID, eventTypeID)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "Safe Event Added"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}