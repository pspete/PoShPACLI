Function Disconnect-PVVault {

	<#
    .SYNOPSIS
    	This command enables log off from the Vault

    .DESCRIPTION
    	Exposes the PACLI Function: "LOGOFF"

    .PARAMETER vault
        The name of the Vault to log off from.

    .PARAMETER user
        The name of the User who is logging off.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Disconnect-PVVault -vault VaultA -user administrator

		Logs off administrator from defined vault VaultA

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)]$vault,
		[Parameter(Mandatory = $True)]$user,
		[Parameter(Mandatory = $False)]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		Write-Verbose "Logging off from Vault"

		$Return = Invoke-PACLICommand $pacli LOGOFF $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Successfully Logged Off"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}
