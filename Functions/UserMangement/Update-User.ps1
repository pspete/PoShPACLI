Function Update-User {

	<#
    .SYNOPSIS
    	Enables a CyberArk User with the appropriate authority to update the
        properties of a CyberArk User account.

    .DESCRIPTION
    	Exposes the PACLI Function: "UPDATEUSER"

    .PARAMETER vault
        The name of the Vault.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER destUser
        The name of the User to be updated.

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
        Whether or not the User is required to provide a SecurID passcode as well
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

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$destUser,
		[Parameter(Mandatory = $False)]
		[ValidateSet("PA_AUTH", "NT_AUTH", "NT_OR_PA_AUTH", "PKI_AUTH", "RADIUS_AUTH", "LDAP_AUTH")]
		[string]$authType,
		[Parameter(Mandatory = $False)][switch]$requireSecureIDAuth,
		[Parameter(Mandatory = $False)][string]$password,
		[Parameter(Mandatory = $False)][string]$certFileName,
		[Parameter(Mandatory = $False)][string]$DN,
		[Parameter(Mandatory = $False)][string]$location,
		[Parameter(Mandatory = $False)][switch]$usersAdmin,
		[Parameter(Mandatory = $False)][switch]$resetPassword,
		[Parameter(Mandatory = $False)][switch]$activateUsers,
		[Parameter(Mandatory = $False)][switch]$safesAdmin,
		[Parameter(Mandatory = $False)][switch]$networksAdmin,
		[Parameter(Mandatory = $False)][switch]$rulesAdmin,
		[Parameter(Mandatory = $False)][switch]$categoriesAdmin,
		[Parameter(Mandatory = $False)][switch]$auditAdmin,
		[Parameter(Mandatory = $False)][switch]$backupAdmin,
		[Parameter(Mandatory = $False)][switch]$restoreAdmin,
		[Parameter(Mandatory = $False)][int]$retention,
		[Parameter(Mandatory = $False)][string]$firstName,
		[Parameter(Mandatory = $False)][string]$middleName,
		[Parameter(Mandatory = $False)][string]$lastName,
		[Parameter(Mandatory = $False)][int]$quota,
		[Parameter(Mandatory = $False)][switch]$disabled,
		[Parameter(Mandatory = $False)][switch]$passwordNeverExpires,
		[Parameter(Mandatory = $False)][switch]$ChangePassword,
		[Parameter(Mandatory = $False)][string]$expirationDate,
		[Parameter(Mandatory = $False)][string]$homeStreet,
		[Parameter(Mandatory = $False)][string]$homeCity,
		[Parameter(Mandatory = $False)][string]$homeState,
		[Parameter(Mandatory = $False)][string]$homeCountry,
		[Parameter(Mandatory = $False)][string]$homeZIP,
		[Parameter(Mandatory = $False)][string]$workPhone,
		[Parameter(Mandatory = $False)][string]$homePhone,
		[Parameter(Mandatory = $False)][string]$cellular,
		[Parameter(Mandatory = $False)][string]$fax,
		[Parameter(Mandatory = $False)][string]$pager,
		[Parameter(Mandatory = $False)][string]$hEmail,
		[Parameter(Mandatory = $False)][string]$bEmail,
		[Parameter(Mandatory = $False)][string]$oEmail,
		[Parameter(Mandatory = $False)][string]$jobTitle,
		[Parameter(Mandatory = $False)][string]$organization,
		[Parameter(Mandatory = $False)][string]$department,
		[Parameter(Mandatory = $False)][string]$profession,
		[Parameter(Mandatory = $False)][string]$workStreet,
		[Parameter(Mandatory = $False)][string]$workCity,
		[Parameter(Mandatory = $False)][string]$workState,
		[Parameter(Mandatory = $False)][string]$workCountry,
		[Parameter(Mandatory = $False)][string]$workZip,
		[Parameter(Mandatory = $False)][string]$homePage,
		[Parameter(Mandatory = $False)][string]$notes,
		[Parameter(Mandatory = $False)][string]$userTypeName,
		[Parameter(Mandatory = $False)][string]$authorizedInterfaces,
		[Parameter(Mandatory = $False)][switch]$enableComponentMonitoring,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli UPDATEUSER $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote authType, retention, quota)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

			$false

		}

		Else {

			$true

		}

	}

}