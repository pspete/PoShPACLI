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

			#Split the output in an array
			#each element represents an event
			$Events = ($Return.StdOut).Split("`n")

			#loop through event data
			For ($i = 0 ; $i -lt $events.count ; $i++) {
				#Event data can sometimes contain xml - detect this.
				#Object output is affected if not dealt with.
				#TODO: Process not currently covered by the Pester Tests.
				If ($events[$i] -match '(\<\?xml[\d\D]*\?\>)') {

					#Remove the XML Tag (causes parse issues if left)
					$events[$i] = $events[$i] -replace '(\<\?xml[\d\D]*\?\>)', ''

					#find subsequent array elements that contain lines from the xml event data
					if ($events[$i + 1] -match '<EventData>') {

						#define integer for loop
						[int]$iXML = $i + 1

						#define integer for xml start
						[int]$FirstXML = $iXML

						#increment the counter
						do {

							[int]$iXML += 1
							#continue until close tag found

						} until ($events[$iXML] -match '</EventData>')

						#join range of the array containing XML and flatten
						$EventData = ((((((($events)[$FirstXML..$iXML] -join ' ') `
												-replace ">(\s*)<", "><") `
											-replace '\n', '') `
										-replace '="', '=') `
									-replace '">', '>') `
								-replace '</EventData>', '</EventData>"') #`
						#-replace '<EventData>','"<EventData>'

						#whitespace, newlines, "quote marks" are all removed
						#"quote marks" added to start and end of string
						#increment outer counter to restart loop at next event
						$i = $iXML + 1

					}

				}

				#Convert event data into output string
				$Values = $events[$i] | Select-String -Pattern "\S" | ConvertFrom-PacliOutput

				#if we have output
				if ($Values) {

					if ($EventData) {

						#add flattened xml to output if present
						$Values += $EventData

					}

					#Output Object
					[PSCustomObject] @{

						"Safename"       = $values[0]
						"SafeID"         = $values[1]
						"EventID"        = $values[2]
						"SourceID"       = $values[3]
						"EventTypeID"    = $values[4]
						"CreationDate"   = $values[5]
						"ExpirationDate" = $values[6]
						"Username"       = $values[7]
						"UserID"         = $values[8]
						"AgentName"      = $values[9]
						"AgentID"        = $values[10]
						"ClientID"       = $values[11]
						"Version"        = $values[12]
						"FromIP"         = $values[13]
						"Data"           = $values[14]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Event

				}

			}

		}

	}

}