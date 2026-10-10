function Get-PVUserSafeList {

	<#
	.SYNOPSIS
	Lists of the Safes to which the specified Safe Owner has ownership.

	.DESCRIPTION
	Exposes the PACLI Function: "OWNERSAFESLIST"

	.PARAMETER owner
	The name of the Safe Owner.

	.EXAMPLE
	Get-PVUserSafeList -owner sec_admin

	Lists safes owned by user sec_admin

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Username')]
		[String]$owner
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand OWNERSAFESLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = @($Return.StdOut | ConvertFrom-PacliOutput)

				#if records returned
				If ($Results) {

					#loop through results
					foreach ($values in $Results) {

						#Output Object
						[PSCustomObject] @{

							'Safename'       = $values[0]
							'AccessLevel'    = $values[1]
							'ExpirationDate' = $values[2]
							'Username'       = $owner

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.User.Safe

					}

				}

			}

		}

	}

}