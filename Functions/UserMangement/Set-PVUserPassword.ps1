Function Set-PVUserPassword {

	<#
    .SYNOPSIS
    	Enables you to change your CyberArk User password.

    .DESCRIPTION
    	Exposes the PACLI Function: "SETPASSWORD"

    .PARAMETER vault
        The name of the Vault to which the User has access

    .PARAMETER user
        The Username of the User who is logged on

    .PARAMETER password
        The User’s current password.

    .PARAMETER newPassword
        The User’s new password.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Set-PVUserPassword -vault Lab -user PacliUser -password (read-host -AsSecureString) -newPassword (Read-Host -AsSecureString)

		Resets the password of the authenticated user

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $False)][securestring]$password,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $False)][securestring]$newPassword,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
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

		$Return = Invoke-PACLICommand $pacli SETPASSWORD $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Password Updated"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}