# .ExternalHelp PoShPACLI-help.xml
function Set-PVRequestStatus {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification = 'ShouldProcess handling is in Invoke-PACLICommand')]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$requestID,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$confirmRequest,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$reason
	)

	process {

		#ConvertTo-ParameterString usually remove "Confirm", which conflicts with a parameter of the function
		$Return = Invoke-PACLICommand -PacliCommand CONFIRMREQUEST -CommandParameters "$($($PSBoundParameters |
		ConvertTo-ParameterString -doNotQuote requestID) -replace 'confirmRequest','confirm') OUTPUT (ALL,ENCLOSE)"

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