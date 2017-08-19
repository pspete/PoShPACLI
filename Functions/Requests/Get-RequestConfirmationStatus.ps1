Function Get-PVRequestStatus {

	<#
    .SYNOPSIS
    	Displays the status of confirmation for a specific request.

    .DESCRIPTION
    	Exposes the PACLI Function: "REQUESTCONFIRMATIONSTATUS"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe for which the request has been created.

    .PARAMETER requestID
        The unique ID number of the request.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVRequestStatus -vault Lab -user administrator -safe EU_Safe -requestID 30

		Returns status of request with ID 38 in EU_Safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][int]$requestID,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli REQUESTCONFIRMATIONSTATUS "$($PSBoundParameters.getEnumerator() |
		ConvertTo-ParameterString -doNotQuote requestID) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 7) {

					#Get Range from array
					$values = $Results[$i..($i + 7)]

					#Output Object
					[PSCustomObject] @{

						"UserName"   = $values[0]
						"GroupName"  = $values[1]
						"Action"     = $values[2]
						"ActionDate" = $values[3]
						"Reason"     = $values[4]
						"UserID"     = $values[5]
						"GroupID"    = $values[6]

					}

				}

			}

		}

	}

}