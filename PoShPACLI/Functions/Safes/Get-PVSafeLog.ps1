Function Get-PVSafeLog {

	<#
    .SYNOPSIS
    	Generates a log of activities per Safe in the specified Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "SAFESLOG"

    .PARAMETER vault
    	The name of the Vault containing the Safe.

    .PARAMETER user
	   The Username of the User carrying out the command.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVSafeLog -vault lab -user auditor

		Lists activities per Safe

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
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(Test-PACLI) {

			#$PACLI variable set to executable path

			#execute pacli with parameters
			$Return = Invoke-PACLICommand $pacli SAFESLOG "$($PSBoundParameters.getEnumerator() |
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
					For($i = 0 ; $i -lt $Results.length ; $i += 4) {

						#Get Range from array
						$values = $Results[$i..($i + 4)]

						#Output Object
						[PSCustomObject] @{

							#assign values to properties
							"Safename"   = $values[0]
							"UsersCount" = $values[1]
							"OpenDate"   = $values[2]
							"OpenState"  = $values[3]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Log -PropertyToAdd @{
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