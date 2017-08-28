Function Set-PVLocation {

	<#
    .SYNOPSIS
    	Updates the properties of a location.

    .DESCRIPTION
    	Exposes the PACLI Function: "UPDATELOCATION"

    .PARAMETER vault
        The name of the Vault to which the User has access.

    .PARAMETER user
        The Username of the User who is carrying out the command.

    .PARAMETER location
        The name of the location to update.
        Note: Add a backslash ‘\’ before the name of the location

    .PARAMETER quota
        The size of the quota to allocate to the location in MB.
        The specification ‘-1’ indicates an unlimited quota allocation.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Set-PVLocation -vault Lab -user administrator -location \EMEA -quota 1000

		Sets quota on EMEA

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $False)][string]$location,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $False)][int]$quota,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli UPDATELOCATION $(

			$PSBoundParameters.getEnumerator() |

			ConvertTo-ParameterString -donotQuote quota)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Updated Location $location"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}