Function Get-PVLocation {

	<#
	.SYNOPSIS
	Generates a list of locations, and their allocated quotas.

	.DESCRIPTION
	Exposes the PACLI Function: "LOCATIONSLIST"

	.PARAMETER vault
	The defined Vault name

	.PARAMETER user
	The Username of the authenticated User.

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	Get-PVLocation -vault Lab -user administrator

	Lists the locations defined in the vault

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

		$Return = Invoke-PACLICommand $Script:PV.ClientPath LOCATIONSLIST "$($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 4) {

					#Get Range from array
					$values = $Results[$i..($i + 4)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Location"   = $values[0]
						"Quota"      = $values[1]
						"UsedQuota"  = $values[2]
						"LocationID" = $values[3]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Location -PropertyToAdd @{
						"vault"     = $vault
						"user"      = $user
						"sessionID" = $sessionID
					}

				}

			}

		}

	}

}