Function Connect-PVVault {

	<#
    .SYNOPSIS
    	This command enables you to log onto the Vault.

    .DESCRIPTION
        Exposes the PACLI Function: "LOGON"
    	Either log onto the Vault with this function by specifying a username and
        password or by using an authentication parameter file. To create this file,
        see the New-PVLogonFile command.

    .PARAMETER vault
        The name of the Vault to log onto

    .PARAMETER user
        The Username of the User logging on

    .PARAMETER password
        The User’s password (as a Secure String).
        Note: The LOGONFILE and PASSWORD parameters cannot be defined together.

    .PARAMETER newPassword
        The User’s new password (as a Secure String); (if the User would like to change password at
        logon time) or NULL.
        Note: The LOGONFILE and NEWPASSWORD parameters cannot be defined together.

    .PARAMETER logonFile
        The full pathname of the logon parameter file which contains the User’s
        name and scrambled password.
        Note: The logonfile parameter cannot be defined with the RADIUS, PASSWORD,
        or NEWPASSWORD parameters.

    .PARAMETER autoChangePassword
        Determines whether or not the password is automatically changed each time
        the User logs onto the Vault.
        It is only relevant when you use the LogonFile parameter of the
        CreateLogonFile command.
        It will generate a randomized new password, change to the new password on
        logon, and will save it to the  authentication file after a successful logon.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .PARAMETER failIfConnected
        Whether or not to disconnect the session if the user is already logged onto
        the Vault through a different interface

    .PARAMETER radius
        Whether or not to enable Radius authentication to the Vault.
        Notes:
            PACLI does not support challenge response for RADIUS authentication.
            The logonfile and radius parameters cannot be defined in the same command.

    .EXAMPLE
		Connect-PVVault -vault VaultA -user User1 -password (read-host -AsSecureString)

		Logs onto defined vault VaultA using User1

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $False)][securestring]$password,
		[Parameter(Mandatory = $False)][securestring]$newPassword,
		[Parameter(Mandatory = $False)][string]$logonFile,
		[Parameter(Mandatory = $False)][switch]$autoChangePassword,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID,
		[Parameter(Mandatory = $False)][switch]$failIfConnected,
		[Parameter(Mandatory = $False)][switch]$radius
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#deal with password SecureString
		if($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		#deal with newPassword SecureString
		if($PSBoundParameters.ContainsKey("newPassword")) {

			#Included decoded password in request
			$PSBoundParameters["newPassword"] = ConvertTo-InsecureString $newPassword

		}

		Write-Verbose "Logging onto Vault"

		$Return = Invoke-PACLICommand $pacli LOGON $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Successfully Logged on"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}