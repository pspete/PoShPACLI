Function Get-PVSafeEvent {

	<#
	.SYNOPSIS
	Lists Safe Events that are written in the current Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "SAFEEVENTSLIST"

	.PARAMETER safePatternName
	A Safe name pattern to include in the returned Events list.

	.PARAMETER sourceIDList
	A specific source ID for filtering the Events list. If this parameter
	is not specified, all the SourceId’s will be included in the
	returned Events list.
	Note: This parameter has been deprecated.

	.PARAMETER eventTypeIDList
	An Event type ID for filtering the Events list. If this parameter is
	not specified, all the EventTypeId’s will be included in the
	returned Events list.

	.PARAMETER fromDate
	The first date to include in the returned Events list.

	.PARAMETER dataSubstring
	The string that is included in the Data field of the Event that will
	be included in the returned Events list.

	.PARAMETER numOfEvents
	The number of recent Events to include in the returned Events list.

	.PARAMETER caseSensitive
	Whether or not the filter according to the ‘datasubstring’
	parameter will be case-sensitive.

	.EXAMPLE
	Get-PVSafeEvent -safePatternName UNIX_Safe

	Retrieves safe events from UNIX_Safe

	.NOTES
	AUTHOR: Pete Maan

    #>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safePatternName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$sourceIDList,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$eventTypeIDList,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[datetime]$fromDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$dataSubstring,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$numOfEvents,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$caseSensitive
	)

	PROCESS {

		if ($PSBoundParameters.ContainsKey("fromDate")) {

			$PSBoundParameters["fromDate"] = (Get-Date $($PSBoundParameters["fromDate"]) -Format dd/MM/yyyy)

		}

		$Return = Invoke-PACLICommand $Script:PV.ClientPath SAFEEVENTSLIST "$($PSBoundParameters |
            ConvertTo-ParameterString -donotQuote numOfEvents) OUTPUT (ALL,ENCLOSE)"

		#If data returned
		if ($Return.StdOut) {

			#Each record is returned as an array of values
			foreach ($Values in @($Return.StdOut | ConvertFrom-PacliOutput)) {

				#Output Object
				[PSCustomObject] @{

					"Safename"       = $Values[0]
					"SafeID"         = $Values[1]
					"EventID"        = $Values[2]
					"SourceID"       = $Values[3]
					"EventTypeID"    = $Values[4]
					"CreationDate"   = $Values[5]
					"ExpirationDate" = $Values[6]
					"Username"       = $Values[7]
					"UserID"         = $Values[8]
					"AgentName"      = $Values[9]
					"AgentID"        = $Values[10]
					"ClientID"       = $Values[11]
					"Version"        = $Values[12]
					"FromIP"         = $Values[13]
					"Data"           = $Values[14]

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Event

			}

		}

	}

}
