Function Get-PVRequestStatus {

	<#
	.SYNOPSIS
	Displays the status of confirmation for a specific request.

	.DESCRIPTION
	Exposes the PACLI Function: "REQUESTCONFIRMATIONSTATUS"

	.PARAMETER safe
	The name of the Safe for which the request has been created.

	.PARAMETER requestID
	The unique ID number of the request.

	.EXAMPLE
	Get-PVRequestStatus -safe EU_Safe -requestID 30

	Returns status of request with ID 38 in EU_Safe

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
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$requestID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath REQUESTCONFIRMATIONSTATUS "$($PSBoundParameters | ConvertTo-ParameterString -doNotQuote requestID) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 7) {

					#Get Range from array
					$values = $Results[$i..($i + 7)]

					#Output Object
					[PSCustomObject] @{

						"UserName"   = $values[0]
						"Groupname"  = $values[1]
						"Action"     = $values[2]
						"ActionDate" = $values[3]
						"Reason"     = $values[4]
						"UserID"     = $values[5]
						"GroupID"    = $values[6]
						"RequestID"  = $requestID
						"Safename"   = $safe

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Request.Status

				}

			}

		}

	}

}