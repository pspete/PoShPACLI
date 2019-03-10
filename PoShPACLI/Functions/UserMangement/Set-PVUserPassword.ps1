Function Set-PVUserPassword {

	<#
    .SYNOPSIS
   	Enables you to change your CyberArk User password.

    .DESCRIPTION
   	Exposes the PACLI Function: "SETPASSWORD"

    .PARAMETER vault
    The defined Vault name

	.PARAMETER user
    The Username of the authenticated User.

    .PARAMETER password
    The User’s current password.

    .PARAMETER newPassword
    The User’s new password.

    .PARAMETER sessionID
   	The ID number of the session. Use this parameter when working
    with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
	Set-PVUserPassword -vault Lab -user PacliUser -password (read-host -AsSecureString) `
	-newPassword (Read-Host -AsSecureString)

	Resets the password of the authenticated user

    .NOTES
   	AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
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
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[securestring]$password,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[securestring]$newPassword,

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

		#deal with newPassword SecureString
		if($PSBoundParameters.ContainsKey("newPassword")) {

			#Included decoded password in request
			$PSBoundParameters["newPassword"] = ConvertTo-InsecureString $newPassword

		}

		$Return = Invoke-PACLICommand $Script:PV.ClientPath SETPASSWORD $($PSBoundParameters |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "Password Updated"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}