Function Open-PVSafe {

	<#
	.SYNOPSIS
	Open a Safe (Safe Owner authorizations required). When the Safe is opened,
	various details about the Safe will be displayed, depending on the
	parameters specified.

	.DESCRIPTION
	Exposes the PACLI Function: "OPENSAFE"

	.PARAMETER safe
	The name of the Safe to open.

	.PARAMETER requestUsageType
	The operation that the user will carry out.

	Possible options are:
		REQUEST_AND_USE – create and send a request if
		necessary, or use the confirmation if it has been granted to
		open the Safe/file/password.

		CHECK_DON’T_USE – check if a request has been sent or,
		if not, create one and send an error. If a request is not
		needed, carry out the action.

		USE_ONLY – if the request has been confirmed, or if a
		request is not needed, open the Safe/file/password.

	Note: In version 4.1, this parameter has no default value and
	is obsolete. However, it can still be used as long as the
	‘userequest’, ‘sendrequest’ and ‘executerequest’ parameters
	are not specified.

	.PARAMETER requestAccessType
	Whether the request is for a single or multiple access.
	Possible options are:
		SINGLE – for a single access.

		MULTIPLE – for multiple accesses.

	.PARAMETER usableFrom
	The proposed date from when the request will be valid.

	.PARAMETER usableTo
	The proposed date until when the request will be valid.

	.PARAMETER requestReason
	The reason for the request.

	.PARAMETER useRequest
	If a confirmed request exists, it will be used.

	.PARAMETER sendRequest
	A request will be sent, if needed.

	.PARAMETER executeRequest
	The action will be executed, if a confirmation exists or is not
	needed.

	.EXAMPLE
	Open-PVSafe -safe System

	Opens the System safe

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
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("REQUEST_AND_USE", "CHECK_DON’T_USE", "USE_ONLY")]
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

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath OPENSAFE "$($PSBoundParameters |
					ConvertTo-ParameterString -donotQuote requestUsageType,requestAccessType) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#Output Object
				[PSCustomObject] @{

					#(possibility these may not all be in the correct order -
					#...but most are)
					"Safename"                  = $Results[0]
					"Status"                    = $Results[1]
					"LastUsed"                  = $Results[2]
					"Accessed"                  = $Results[3]
					"Size"                      = $Results[4]
					"Location"                  = $Results[5]
					"SafeID"                    = $Results[6]
					"LocationID"                = $Results[7]
					"TextOnly"                  = $Results[8]
					"ShareOptions"              = $Results[9]
					"UseFileCategories"         = $Results[10]
					"RequireContentValidation"  = $Results[11]
					"RequireReason"             = $Results[12]
					"EnforceExclusivePasswords" = $Results[13]

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe

			}

		}

	}

}