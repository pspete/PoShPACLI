Function Get-PVTrustedNetworkArea {

	<#
	.SYNOPSIS
	Lists Trusted Network Areas

	.DESCRIPTION
	Exposes the PACLI Function: "TRUSTEDNETWORKAREASLIST"

	.PARAMETER trusterName
	The User who has access to the Trusted Network Area

	.EXAMPLE
	Get-PVTrustedNetworkArea -trusterName lydia

	Lists Trusted Network Areas for user lydia

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$trusterName
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath TRUSTEDNETWORKAREASLIST "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 6) {

					#Get Range from array
					$values = $Results[$i..($i + 6)]

					#Output Object
					[PSCustomObject] @{

						"NetworkArea"       = $values[0]
						"FromHour"          = $values[1]
						"ToHour"            = $values[2]
						"Active"            = $values[3]
						"MaxViolationCount" = $values[4]
						"ViolationCount"    = $values[5]
						"Username"          = $trusterName

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.NetworkArea.Trusted

				}

			}

		}

	}

}