Function Get-PVRequest {

	<#
	.SYNOPSIS
	Lists requests from users who wish to enter Safes that require manual
	access confirmation from authorized users.

	.DESCRIPTION
	Exposes the PACLI Function: "REQUESTSLIST"

	.PARAMETER requestsType
	The type of requests to display.
	The options are:
		MY_REQUESTS – your user requests for access.
		INCOMING_REQUESTS – other users’ requests for you
			to authorize.
		ALL_REQUESTS – other users’ requests as well as
			your own user requests (in the  CyberArk Vault
			version 3.5 and above).

	.PARAMETER requestorPattern
	Pattern of the username of the user who created the request.

	.PARAMETER safePattern
	Pattern of the Safe specified in the request.

	.PARAMETER objectPattern
	Pattern of the file or password specified in the request.
	Note: This parameter specifies the full object name, including
	the folder. Either specify the full name of a specific object, or
	use an asterisk (*) before the object name.

	.PARAMETER waiting
	Whether or not the request is waiting for a response.

	.PARAMETER confirmed
	Whether or not the request is waiting for a confirmation.

	.PARAMETER displayInvalid
	Whether to display all requests or only invalid ones.
	The options are:
		ALL_REQUESTS
		ONLY_VALID
		ONLY_INVALID

	.PARAMETER includeAlreadyHandled
	Whether to include requests that have already been handled
	in the list of requests.

	.PARAMETER requestID
	The unique ID number of the request.

	.PARAMETER objectsType
	The type of operation that generated this request.
	Possible values:
		ALL_OBJECTS
		GET_FILE
		GET_PASSWORD
		OPEN_SAFE

	.EXAMPLE
	Get-PVRequest -requestsType INCOMING_REQUESTS

	Lists all Incoming Requests for the authenticated user

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("MY_REQUESTS", "INCOMING_REQUESTS", "ALL_REQUESTS")]
		[string]$requestsType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$requestorPattern,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$safePattern,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$objectPattern,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$waiting,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$confirmed,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("ALL_REQUESTS", "ONLY_VALID", "ONLY_INVALID")]
		[string]$displayInvalid,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeAlreadyHandled,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$requestID,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("ALL_OBJECTS", "GET_FILE", "GET_PASSWORD", "OPEN_SAFE")]
		[string]$objectsType
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath REQUESTSLIST "$($PSBoundParameters |
            ConvertTo-ParameterString -donotQuote requestsType,displayInvalid,objectsType) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 21) {

					#Get Range from array
					$values = $Results[$i..($i + 21)]

					#Output Object
					[PSCustomObject] @{

						"RequestID"         = $values[0]
						"Username"          = $values[1]
						"Operation"         = $values[2]
						"Safe"              = $values[3]
						"File"              = $values[4]
						"Confirmed"         = $values[5]
						"Reason"            = $values[6]
						"Status"            = $values[7]
						"InvalidReason"     = $values[8]
						"Confirmations"     = $values[9]
						"Rejections"        = $values[10]
						"ConfirmationsLeft" = $values[11]
						"CreationDate"      = $values[12]
						"LastUsedDate"      = $values[13]
						"ExpirationDate"    = $values[14]
						"AccessType"        = $values[15]
						"UsableFrom"        = $values[16]
						"UsableTo"          = $values[17]
						"SafeID"            = $values[18]
						"UserID"            = $values[19]
						"FileID"            = $values[20]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Request

				}

			}

		}

	}

}