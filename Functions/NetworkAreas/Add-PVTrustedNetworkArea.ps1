Function Add-PVTrustedNetworkArea {

	<#
    .SYNOPSIS
    	Adds a Trusted Network Area from which a CyberArk User can access the
        CyberArk Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDTRUSTEDNETWORKAREA"

    .PARAMETER vault
	   The name of the Vault to which to add the Trusted Network Area.

    .PARAMETER user
	   The name of the User carrying out the task.

    .PARAMETER trusterName
	   The User who will have access to the Trusted Network Area.

    .PARAMETER networkArea
	   The name of the Trusted Network Area to add.

    .PARAMETER fromHour
	   The time from which access to the Vault is permitted.

    .PARAMETER toHour
	   The time until which access to the Vault is permitted.

    .PARAMETER maxViolationCount
	   The maximum number of access violations permitted before the User is not
       permitted to access the Vault.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Add-PVTrustedNetworkArea -vault Lab -user administrator -trusterName user1 -networkArea "All\VPN"

		Adds VPN Trusted Network Area to user1

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$trusterName,
		[Parameter(Mandatory = $True)][string]$networkArea,
		[Parameter(Mandatory = $False)][int]$fromHour,
		[Parameter(Mandatory = $False)][int]$toHour,
		[Parameter(Mandatory = $False)][int]$maxViolationCount,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDTRUSTEDNETWORKAREA $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote fromHour, toHour, maxViolationCount)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Trusted Network Area $networkarea Assigned to $trusterName"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}