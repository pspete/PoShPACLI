Function Add-PVSafeGWAccount {

	<#
    .SYNOPSIS
    	Shares a Safe through a Gateway account

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDSAFESHARE"

    .PARAMETER vault
	   The name of the Vault to which the User has access.

    .PARAMETER user
	   The Username of the User carrying out the task.

    .PARAMETER safe
	   The Safe to share through the Gateway

    .PARAMETER gwAccount
	   The name of the Gateway account through which the Safe is shared

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Add-PVSafeGWAccount -vault Lab -user administrator -safe Team_Safe -gwAccount PVWAGWUser

		Adds Gateway account PVWAGWUser to shared safe Team_Safe.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][Alias("Safename")][string]$safe,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $False)][string]$gwAccount,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDSAFESHARE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "$safe Shared via $gwAccount"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}