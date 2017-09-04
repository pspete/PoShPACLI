Function Get-PVLocation {

	<#
    .SYNOPSIS
    	Generates a list of locations, and their allocated quotas.

    .DESCRIPTION
    	Exposes the PACLI Function: "LOCATIONSLIST"

    .PARAMETER vault
       The name of the Vault in which the location is defined.

    .PARAMETER user
        The Username of the User who is carrying out the command.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVLocation -vault Lab -user administrator

		Lists the locations defined in the vault

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
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
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(!(Test-PACLI)) {

			#$pacli variable not set or not a valid path

		}

		Else {

			#$PACLI variable set to executable path

			#execute pacli with parameters
			$Return = Invoke-PACLICommand $pacli LOCATIONSLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

			if($Return.ExitCode) {

				Write-Error $Return.StdErr

			}

			else {

				#if result(s) returned
				if($Return.StdOut) {

					#Convert Output to array
					$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

					#loop through results
					For($i = 0 ; $i -lt $Results.length ; $i += 4) {

						#Get Range from array
						$values = $Results[$i..($i + 4)]

						#Output Object
						[PSCustomObject] @{

							#assign values to properties
							"Name"       = $values[0]
							"Quota"      = $values[1]
							"UsedQuota"  = $values[2]
							"LocationID" = $values[3]

						} | Add-ObjectDetail -DefaultProperties Name, Quota,
						UsedQuota, LocationID -PropertyToAdd @{
							"vault"     = $vault
							"user"      = $user
							"sessionID" = $sessionID
						}

					}

				}

			}

		}

	}

}