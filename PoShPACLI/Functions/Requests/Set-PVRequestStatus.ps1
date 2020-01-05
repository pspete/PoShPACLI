Function Set-PVRequestStatus {

	<#
	.SYNOPSIS
	Enables authorized users or groups to confirm a request.

	.DESCRIPTION
	Exposes the PACLI Function: "CONFIRMREQUEST"

	.PARAMETER safe
	The name of the Safe for which the request has been created.

	.PARAMETER requestID
	The unique ID number of the request.

	.PARAMETER confirmRequest
	Whether to confirm or reject this request.

	.PARAMETER reason
	The reason for the action taken by the authorized user or group.

	.EXAMPLE
	Set-PVRequestStatus -safe SQL -requestID 11 -confirm

	Confirms request with ID 11 in safe SQL

	.NOTES
	AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
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

	PROCESS {

		#ConvertTo-ParameterString usually remove "Confirm", which conflicts with a parameter of the function
		$Return = Invoke-PACLICommand $Script:PV.ClientPath CONFIRMREQUEST "$($($PSBoundParameters |
		ConvertTo-ParameterString -doNotQuote requestID) -replace "confirmRequest","confirm") OUTPUT (ALL,ENCLOSE)"

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