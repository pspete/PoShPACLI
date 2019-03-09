Function Get-PVUserActivity {

	<#
    .SYNOPSIS
    	This command generates a list of activities carried out in the specified
        Vault for the user who issues this command.
        The Safes included in the output are those to which the User carrying out
        the command has authorization.

    .DESCRIPTION
    	Exposes the PACLI Function: "INSPECTUSER"

    .PARAMETER vault
        The defined Vault name

    .PARAMETER user
        The Username of the authenticated User.

    .PARAMETER logDays
        The number of days to include in the list of activities.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVUserActivity -vault Lab -user administrator -logDays 5

		Lists vault user activity from the last 5 days

    .NOTES
    	AUTHOR: Pete Maan

    #>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[int]$logDays,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath INSPECTUSER "$($PSBoundParameters.getEnumerator() |
            	ConvertTo-ParameterString -donotQuote logDays) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode -eq 0) {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 9) {

					#Get Range from array
					$values = $Results[$i..($i + 9)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Time"          = $values[0]
						"Username"      = $values[1]
						"Safe"          = $values[2]
						"Activity"      = $values[3]
						"Location"      = $values[4]
						"NewLocation"   = $values[5]
						"RequestID"     = $values[6]
						"RequestReason" = $values[7]
						"Code"          = $values[8]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.User.Activity -PropertyToAdd @{
						"vault"     = $vault
						"user"      = $user
						"sessionID" = $sessionID
					}

				}

			}

		}

	}

}