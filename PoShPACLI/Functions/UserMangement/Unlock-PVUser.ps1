Function Unlock-PVUser {

	<#
    .SYNOPSIS
    	Unlocks the User account of the CyberArk User who is currently logged on.

    .DESCRIPTION
    	Exposes the PACLI Function: "UNLOCK"

    .PARAMETER vault
        The defined Vault name

    .PARAMETER user
        The Username of the authenticated User.

    .PARAMETER password
        The User’s password

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Unlock-PVUser -vault Lab -user administrator -password (read-host -AsSecureString)

		Unlocks the current user (administrator), after supplying password for the account.

    .NOTES
    	AUTHOR: Pete Maan

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
			ValueFromPipelineByPropertyName = $False)]
		[securestring]$password,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		#deal with password SecureString
		if($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		$Return = Invoke-PACLICommand $Script:PV.ClientPath UNLOCK $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "User Unlocked"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}