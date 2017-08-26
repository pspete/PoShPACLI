Function Get-PVSafeOwner {

	<#
    .SYNOPSIS
    	Produces a list of all the Safe Owners of the specified Safe(s).

    .DESCRIPTION
    	Exposes the PACLI Function: "OWNERSLIST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER safePattern
        The full name or part of the name of the Safe(s) to include in the list.
        Alternatively, a wildcard can be used in this parameter.

    .PARAMETER ownerPattern
        The full name or part of the name of the Owner(s) to include in the list.
        Alternatively, a wildcard can be used in this parameter.

    .PARAMETER includeGroupMembers
        Whether or not to include individual members of Groups in the list.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVSafeOwner -vault lab -user administrator -safePattern system -ownerPattern *

		Lists all owners of the SYSTEM safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safePattern,
		[Parameter(Mandatory = $True)][string]$ownerPattern,
		[Parameter(Mandatory = $False)][switch]$includeGroupMembers,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli OWNERSLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 11) {

					#Get Range from array
					$values = $Results[$i..($i + 11)]

					#Output Object
					[PSCustomObject] @{

						"Name"              = $values[0]
						"Group"             = $values[1]
						"SafeName"          = $values[2]
						"AccessLevel"       = $values[3]
						"OpenDate"          = $values[4]
						"OpenState"         = $values[5]
						"ExpirationDate"    = $values[6]
						"GatewayAccount"    = $values[7]
						"ReadOnlyByDefault" = $values[8]
						"SafeID"            = $values[9]
						"UserID"            = $values[10]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Owner -PropertyToAdd @{
						"vault"     = $vault
						"user"      = $user
						"sessionID" = $sessionID
					}

				}

			}

		}

	}

}