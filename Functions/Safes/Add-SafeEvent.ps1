﻿Function Add-SafeEvent {

	<#
    .SYNOPSIS
    	Adds a new application Event manually to the current Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDEVENT"

    .PARAMETER vault
        The name of the Vault where the Event is saved.

    .PARAMETER user
        The Username of the User carrying out the task.

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
		Add-SafeEvent -vault Lab -user administrator -safe Windows_Safe -sourceID 9999 -eventTypeID 9000 -data "Event Data"

		Adds event to safe Windows_Safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][String]$safe,
		[Parameter(Mandatory = $True)][String]$sourceID,
		[Parameter(Mandatory = $True)][String]$eventTypeID,
		[Parameter(Mandatory = $True)][String]$data,
		[Parameter(Mandatory = $False)][int]$sessionID
	)


	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDEVENT $($PSBoundParameters.getEnumerator() |

			ConvertTo-ParameterString -donotQuote sourceID, eventTypeID)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}