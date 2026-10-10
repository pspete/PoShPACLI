# .ExternalHelp PoShPACLI-help.xml
function Get-PVRequest {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('MY_REQUESTS', 'INCOMING_REQUESTS', 'ALL_REQUESTS')]
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
		[ValidateSet('ALL_REQUESTS', 'ONLY_VALID', 'ONLY_INVALID')]
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
		[ValidateSet('ALL_OBJECTS', 'GET_FILE', 'GET_PASSWORD', 'OPEN_SAFE')]
		[string]$objectsType
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand REQUESTSLIST -CommandParameters "$($PSBoundParameters |
            ConvertTo-ParameterString -donotQuote requestsType,displayInvalid,objectsType) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = @($Return.StdOut | ConvertFrom-PacliOutput)

				#if records returned
				If ($Results) {

					#loop through results
					foreach ($values in $Results) {

						#Output Object
						[PSCustomObject] @{

							'RequestID'         = $values[0]
							'Username'          = $values[1]
							'Operation'         = $values[2]
							'Safe'              = $values[3]
							'File'              = $values[4]
							'Confirmed'         = $values[5]
							'Reason'            = $values[6]
							'Status'            = $values[7]
							'InvalidReason'     = $values[8]
							'Confirmations'     = $values[9]
							'Rejections'        = $values[10]
							'ConfirmationsLeft' = $values[11]
							'CreationDate'      = $values[12]
							'LastUsedDate'      = $values[13]
							'ExpirationDate'    = $values[14]
							'AccessType'        = $values[15]
							'UsableFrom'        = $values[16]
							'UsableTo'          = $values[17]
							'SafeID'            = $values[18]
							'UserID'            = $values[19]
							'FileID'            = $values[20]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Request

					}

				}

			}

		}

	}

}