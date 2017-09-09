Function Get-PVUserSafeList {

	<#
    .SYNOPSIS
    	Lists of the Safes to which the specified Safe Owner has ownership.

    .DESCRIPTION
    	Exposes the PACLI Function: "OWNERSAFESLIST"

    .PARAMETER vault
        The name of the Vault to which the Safe Owner has access.

    .PARAMETER user
        The Username of the User carrying out the task

    .PARAMETER owner
        The name of the Safe Owner.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVUserSafeList -vault Lab -user administrator -owner sec_admin

		Lists safes owned by user sec_admin

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
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[String]$owner,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(Test-PACLI) {

			#$PACLI variable set to executable path

			#execute pacli
			$Return = Invoke-PACLICommand $pacli OWNERSAFESLIST "$($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

			if($Return.ExitCode) {

				Write-Error $Return.StdErr

			}

			else {

				#if result(s) returned
				if($Return.StdOut) {

					#Convert Output to array
					$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

					#loop through results
					For($i = 0 ; $i -lt $Results.length ; $i += 3) {

						#Get Range from array
						$values = $Results[$i..($i + 3)]

						#Output Object
						[PSCustomObject] @{

							"Safename"       = $values[0]
							"AccessLevel"    = $values[1]
							"ExpirationDate" = $values[2]
							"Username"       = $owner

						} | Add-ObjectDetail -DefaultProperties Safename, AccessLevel, ExpirationDate -PropertyToAdd @{
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