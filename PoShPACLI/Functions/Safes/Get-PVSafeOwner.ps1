Function Get-PVSafeOwner {

	<#
	.SYNOPSIS
	Produces a list of all the Safe Owners of the specified Safe(s).

	.DESCRIPTION
	Exposes the PACLI Function: "OWNERSLIST"

	.PARAMETER safePattern
	The full name or part of the name of the Safe(s) to include in the list.
	Alternatively, a wildcard can be used in this parameter.

	.PARAMETER ownerPattern
	The full name or part of the name of the Owner(s) to include in the list.
	Alternatively, a wildcard can be used in this parameter.

	.PARAMETER includeGroupMembers
	Whether or not to include individual members of Groups in the list.

	.EXAMPLE
	Get-PVSafeOwner -safePattern system -ownerPattern *

	Lists all owners of the SYSTEM safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safePattern,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ownerPattern,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeGroupMembers
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath OWNERSLIST "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 11) {

					#Get Range from array
					$values = $Results[$i..($i + 11)]

					#Output Object
					[PSCustomObject] @{

						"Username"          = $values[0]
						"Group"             = $values[1]
						"Safename"          = $values[2]
						"AccessLevel"       = $values[3]
						"OpenDate"          = $values[4]
						"OpenState"         = $values[5]
						"ExpirationDate"    = $values[6]
						"GatewayAccount"    = $values[7]
						"ReadOnlyByDefault" = $values[8]
						"SafeID"            = $values[9]
						"UserID"            = $values[10]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Owner

				}

			}

		}

	}

}