Function Set-PVUserPassword {

	<#
    .SYNOPSIS
   	Enables you to change your CyberArk User password.

    .DESCRIPTION
   	Exposes the PACLI Function: "SETPASSWORD"

    .PARAMETER password
    The User’s current password.

    .PARAMETER newPassword
    The User’s new password.

    .EXAMPLE
	Set-PVUserPassword -password (read-host -AsSecureString) -newPassword (Read-Host -AsSecureString)

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
		[securestring]$password,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$newPassword
	)

	PROCESS {

		#deal with password SecureString
		if ($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		#deal with newPassword SecureString
		if ($PSBoundParameters.ContainsKey("newPassword")) {

			#Included decoded password in request
			$PSBoundParameters["newPassword"] = ConvertTo-InsecureString $newPassword

		}

		$Null = Invoke-PACLICommand $Script:PV.ClientPath SETPASSWORD $($PSBoundParameters | ConvertTo-ParameterString)



	}

}