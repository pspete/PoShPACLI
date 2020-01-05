Function Get-PVSafeLog {

	<#
	.SYNOPSIS
	Generates a log of activities per Safe in the specified Vault.

	.DESCRIPTION
	Exposes the PACLI Function: "SAFESLOG"

	.EXAMPLE
	Get-PVSafeLog

	Lists activities per Safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param()

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath SAFESLOG "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 4) {

					#Get Range from array
					$values = $Results[$i..($i + 4)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Safename"   = $values[0]
						"UsersCount" = $values[1]
						"OpenDate"   = $values[2]
						"OpenState"  = $values[3]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Log

				}

			}

		}

	}

}