﻿Function Get-SafeEvents {

	<#
    .SYNOPSIS
    	Lists Safe Events that are written in the current Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "SAFEEVENTSLIST"

    .PARAMETER vault
        The name of the Vault that contains the Events.

    .PARAMETER user
        The name of the User who is carrying out the task.

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

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Get-SafeEvents -vault Lab -user administrator -safePatternName UNIX_Safe

		Retrieves safe events from UNIX_Safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $False)][string]$safePatternName,
		[Parameter(Mandatory = $False)][string]$sourceIDList,
		[Parameter(Mandatory = $False)][string]$eventTypeIDList,
		[Parameter(Mandatory = $False)]
		[ValidateScript( {($_ -eq (get-date $_ -f dd/MM/yyyy))})]
		[string]$fromDate,
		[Parameter(Mandatory = $False)][string]$dataSubstring,
		[Parameter(Mandatory = $False)][int]$numOfEvents,
		[Parameter(Mandatory = $False)][switch]$caseSensitive,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli SAFEEVENTSLIST "$($PSBoundParameters.getEnumerator() |
            ConvertTo-ParameterString -donotQuote numOfEvents) OUTPUT (ALL,ENCLOSE)" -DoNotWait

		#If data returned
		if($Return.StdOut) {

			#Split the output in an array
			#each element represents an event
			$Events = ($Return.StdOut).Split("`n")

			#loop through event data
			For($i = 0 ; $i -lt $events.count ; $i++) {
				#Event data can sometimes contain xml - detect this
				#Object output is affected if not dealt with
				If($events[$i] -match '(\<\?xml[\d\D]*\?\>)') {

					#Remove the XML Tag (causes parse issues if left)
					$events[$i] = $events[$i] -replace '(\<\?xml[\d\D]*\?\>)', ''

					#find subsequent array elements that contain lines from the xml event data
					if($events[$i + 1] -match '<EventData>') {

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
						#incrament outer counter to restart loop at next event
						$i = $iXML + 1

					}

				}

				#Convert event data into output string
				$Values = $events[$i]  | Select-String -Pattern "\S" | ConvertFrom-PacliOutput

				#if we have output
				if($Values) {

					if($EventData) {

						#add flattened xml to output if present
						$Values += $EventData

					}

					#Output Object
					[PSCustomObject] @{

						"SafeName"       = $values[0]
						"SafeID"         = $values[1]
						"EventID"        = $values[2]
						"SourceID"       = $values[3]
						"EventTypeID"    = $values[4]
						"CreationDate"   = $values[5]
						"ExpirationDate" = $values[6]
						"UserName"       = $values[7]
						"UserID"         = $values[8]
						"AgentName"      = $values[9]
						"AgentID"        = $values[10]
						"ClientID"       = $values[11]
						"Version"        = $values[12]
						"FromIP"         = $values[13]
						"Data"           = $values[14]

					}

				}

			}

		}

	}

}