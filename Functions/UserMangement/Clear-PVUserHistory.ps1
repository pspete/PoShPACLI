Function Clear-PVUserHistory {

	<#
    .SYNOPSIS
    	Clears the history records for Users of the specified Vault

    .DESCRIPTION
    	Exposes the PACLI Function: "CLEARUSERHISTORY"

    .PARAMETER vault
    	The name of the Vault in which to clear the history records

    .PARAMETER user
    	The Username of the User carrying out the command.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Clear-PVUserHistory -vault Lab -user administrator

		Clears the history records for Users of the Vault "Lab"

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
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

		If(!(Test-PACLI)) {

			#$pacli variable not set or not a valid path

		}

		Else {

			#$PACLI variable set to executable path

			$Return = Invoke-PACLICommand $pacli CLEARUSERHISTORY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

			if($Return.ExitCode) {

				Write-Error $Return.StdErr

			}

			else {

				Write-Verbose "History Cleared from $user"

				[PSCustomObject] @{

					"vault"     = $vault
					"user"      = $user
					"sessionID" = $sessionID

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI

			}

		}

	}

}