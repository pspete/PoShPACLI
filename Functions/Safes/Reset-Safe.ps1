Function Reset-Safe {

	<#
    .SYNOPSIS
    	Resets the access marks on an open Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "RESETSAFE"

    .PARAMETER vault
        The name of the Vault to reset.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER safe
        The name of the Safe containing the access marks to reset.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Reset-Safe -vault lab -user administrator -safe ORACLE

		Resets access marks on ORACLE safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][String]$safe,
		[Parameter(Mandatory = $False)][int]$sessionID
	)


	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli RESETSAFE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}