Function Confirm-Request {

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

    .PARAMETER confirm
        Whether to confirm or reject this request.

    .PARAMETER reason
        The reason for the action taken by the authorized user or group.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$requestID,
		[Parameter(Mandatory = $True)][string]$confirm,
		[Parameter(Mandatory = $False)][string]$reason,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli CONFIRMREQUEST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

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
						"User"              = $values[1]
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

					}

				}

			}

		}

	}

}