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

		$Null = Invoke-PACLICommand $Script:PV.ClientPath SETPASSWORD -SecretParameters $PSBoundParameters $($PSBoundParameters | ConvertTo-ParameterString)



	}

}