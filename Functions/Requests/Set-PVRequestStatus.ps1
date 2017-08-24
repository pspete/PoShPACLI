Function Set-PVRequestStatus {

	<#
    .SYNOPSIS
    	Enables authorized users or groups to confirm a request.

    .DESCRIPTION
    	Exposes the PACLI Function: "CONFIRMREQUEST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe for which the request has been created.

    .PARAMETER requestID
        The unique ID number of the request.

    .PARAMETER confirmRequest
        Whether to confirm or reject this request.

    .PARAMETER reason
        The reason for the action taken by the authorized user or group.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Set-PVRequestStatus -vault Lab -user administrator -safe SQL -requestID 11 -confirm

		Confirms request with ID 11 in safe SQL

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][int]$requestID,
		[Parameter(Mandatory = $True)][switch]$confirmRequest,
		[Parameter(Mandatory = $False)][string]$reason,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#ConvertTo-ParameterString usually remove "Confirm", which conflists with a parameter of the function
		$Return = Invoke-PACLICommand $pacli CONFIRMREQUEST "$($($PSBoundParameters.getEnumerator() |
		ConvertTo-ParameterString -doNotQuote requestID) -replace "confirmRequest","confirm") OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 21) {

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

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI -PropertyToAdd @{
						"vault"     = $vault
						"user"      = $user
						"sessionID" = $sessionID
					}

				}

			}

		}

	}

}