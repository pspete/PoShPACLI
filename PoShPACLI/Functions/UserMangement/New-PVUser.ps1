Function New-PVUser {

	<#
	.SYNOPSIS
	Enables a CyberArk User to be added to the Vault, and given administration
	permissions.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDUSER"

	.PARAMETER destUser
	The name of the User to add to the Vault.

	.PARAMETER authType

	The type of authentication by which the User will logon to the Vault.
	Specify one of the following:
	PA_AUTH – Password authentication. This is the default.
	NT_AUTH – NT authentication.
	NT_OR_PA_AUTH – Either password or NT authentication.
	PKI_AUTH – PKI authentication. This requires a valid certfilename parameter.
	RADIUS_AUTH – Radius authentication. This does not require any other
		additional parameters.
	LDAP_AUTH – LDAP authentication.

	.PARAMETER requireSecureIDAuth
	Whether or not the User is required to provide a SecureID passcode as well
	as the method specified in the authtype parameter

	.PARAMETER password
	The password of the User to add to the Vault, if the authentication type
	is PA_AUTH.

	.PARAMETER certFileName
	The name of the certificate file that enables users to log on with PKI
	authentication.

	Use either this parameter or ‘dn’.
	If Vault version is lower than version 3.5, this parameter must be specified.

	.PARAMETER DN
	The User's Distinguished Name received from the directory or Certified Authority.
	This parameter enables users to log on with PKI authentication.
	Use either this parameter or ‘CertFileName’.

	.PARAMETER location
	The location from which the User will log on.
	A backslash ‘\’ must be added before the name of the location.

	.PARAMETER usersAdmin
	Whether or not the User can manage other Users

	.PARAMETER resetPassword
	Whether or not the User can reset user’s passwords or select ‘User Must Change
	Password at Next Logon’ for other users.

	.PARAMETER activateUsers
	Whether or not the User can activate or deactivate user network areas.

	.PARAMETER safesAdmin
	Whether or not the User can manage Safes.

	.PARAMETER networksAdmin
	Whether or not the User can manage network settings

	.PARAMETER rulesAdmin
	Whether or not the User can manage external user rules.

	.PARAMETER categoriesAdmin
	Whether or not the User can edit File Categories

	.PARAMETER auditAdmin
	Indicates whether or not the User can audit users in the same location or sublocations
	in the Vault hierarchy.

	.PARAMETER backupAdmin
	Whether or not the User can backup all the Safes in the Vault.

	.PARAMETER restoreAdmin
	Whether or not the User can restore all the Safes in the Vault.

	.PARAMETER gatewayAccount
	Whether or not this account is a Gateway account.
	Note: A Gateway account user can only authenticate to the Vault with either password
	or RADIUS authentication.

	.PARAMETER retention
	The number of days to keep the User log records.

	.PARAMETER firstName
	The User’s first name.

	.PARAMETER middleName
	The User’s middle name.

	.PARAMETER lastName
	The User’s last name.

	.PARAMETER quota
	The disk quota that is allocated to the location in MB.
	The specification ‘-1’ indicates an unlimited quota allocation.

	.PARAMETER disabled
	Whether or not the User account is disabled.

	.PARAMETER passwordNeverExpires
	Whether or not the User’s password never expires.

	.PARAMETER ChangePassword
	Whether or not the User is required to change their password
	after they logon for the first time.

	.PARAMETER expirationDate
	The date on which the User’s account expires, if applicable.

	.PARAMETER homeStreet
	The name of the street where the User lives.

	.PARAMETER homeCity
	The name of the city where the User lives.

	.PARAMETER homeState
	The name of the state where the User lives

	.PARAMETER homeCountry
	The name of the country where the User lives.

	.PARAMETER homeZIP
	The zip code of the User’s address.

	.PARAMETER workPhone
	The User’s work phone number.

	.PARAMETER homePhone
	The User’s home phone number.

	.PARAMETER cellular
	The User’s cellular phone number.

	.PARAMETER fax
	The User’s fax number.

	.PARAMETER pager
	The number of the User’s pager

	.PARAMETER hEmail
	The User’s home e-mail address

	.PARAMETER bEmail
	The User’s business e-mail address.

	.PARAMETER oEmail
	Another e-mail address for the User.

	.PARAMETER jobTitle
	The User’s job title.

	.PARAMETER organization
	The name of the User’s organization.

	.PARAMETER department
	The name of the User’s department.

	.PARAMETER profession
	The User’s profession.

	.PARAMETER workStreet
	The street where the User’s office is located.

	.PARAMETER workCity
	The city where the User’s office is located.

	.PARAMETER workState
	The state where the User’s office is located.

	.PARAMETER workCountry
	The country where the User’s office is located.

	.PARAMETER workZip
	The zip code of the User’s office address.

	.PARAMETER homePage
	The URL of the homepage of the User’s company.

	.PARAMETER notes
	Optional notes about the User.

	.PARAMETER userTypeName
	The name of the user type allocated to this user.

	.PARAMETER authorizedInterfaces
	The CyberArk interfaces that this user is authorized to use.

	.PARAMETER enableComponentMonitoring
	Whether or not email notifications are sent for component users who
	have not accessed the Vault.

	.EXAMPLE
	New-PVUser -destUser backup1 -password (read-host -AsSecureString) -backupAdmin -location "\"

	Creates a new vault user in the root location, named backup1, with backup admin vault rights.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$destUser,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$authType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$requireSecureIDAuth,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$certFileName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$DN,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$usersAdmin,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$resetPassword,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$activateUsers,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$safesAdmin,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$networksAdmin,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$rulesAdmin,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$categoriesAdmin,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$auditAdmin,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$backupAdmin,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$restoreAdmin,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$gatewayAccount,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$retention,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$firstName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$middleName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$lastName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$quota,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$disabled,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$passwordNeverExpires,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$ChangePassword,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$expirationDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$homeStreet,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$homeCity,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$homeState,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$homeCountry,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$homeZIP,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$workPhone,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$homePhone,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$cellular,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fax,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$pager,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$hEmail,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$bEmail,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$oEmail,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$jobTitle,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$organization,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$department,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$profession,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$workStreet,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$workCity,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$workState,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$workCountry,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$workZip,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$homePage,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$notes,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$userTypeName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$authorizedInterfaces,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$enableComponentMonitoring
	)

	PROCESS {

		#deal with password SecureString
		if ($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDUSER $($PSBoundParameters |
			ConvertTo-ParameterString -doNotQuote password, retention, quota, authType)



	}

}