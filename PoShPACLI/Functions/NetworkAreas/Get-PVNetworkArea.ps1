Function Get-PVNetworkArea {

	<#
	.SYNOPSIS
	Lists all of the Network Areas that are defined in the Vault.

	.DESCRIPTION
	Exposes the PACLI Function: "NETWORKAREASLIST"

	.EXAMPLE
	Get-PVNetworkArea

	Lists all network areas

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param()

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath NETWORKAREASLIST "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 2) {

					#Get Range from array
					$values = $Results[$i..($i + 2)]

					#Output Object
					[PSCustomObject] @{

						"NetworkArea"   = $values[0]
						"SecurityLevel" = $values[1]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.NetworkArea

				}

			}

		}

	}

}