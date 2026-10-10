---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Set-PVUser
---

# Set-PVUser

## SYNOPSIS
Enables a CyberArk User with the appropriate authority to update the
properties of a CyberArk User account.

## SYNTAX

```
Set-PVUser [-destUser] <String> [[-authType] <String>] [-requireSecurIDAuth] [[-password] <SecureString>]
 [[-certFileName] <String>] [[-DN] <String>] [[-location] <String>] [-usersAdmin] [-resetPassword]
 [-activateUsers] [-safesAdmin] [-networksAdmin] [-rulesAdmin] [-categoriesAdmin] [-auditAdmin] [-backupAdmin]
 [-restoreAdmin] [[-retention] <Int32>] [[-firstName] <String>] [[-middleName] <String>] [[-lastName] <String>]
 [[-quota] <Int32>] [-disabled] [-passwordNeverExpires] [-ChangePassword] [[-expirationDate] <String>]
 [[-homeStreet] <String>] [[-homeCity] <String>] [[-homeState] <String>] [[-homeCountry] <String>]
 [[-homeZIP] <String>] [[-workPhone] <String>] [[-homePhone] <String>] [[-cellular] <String>] [[-fax] <String>]
 [[-pager] <String>] [[-hEmail] <String>] [[-bEmail] <String>] [[-oEmail] <String>] [[-jobTitle] <String>]
 [[-organization] <String>] [[-department] <String>] [[-profession] <String>] [[-workStreet] <String>]
 [[-workCity] <String>] [[-workState] <String>] [[-workCountry] <String>] [[-workZip] <String>]
 [[-homePage] <String>] [[-notes] <String>] [[-userTypeName] <String>] [[-authorizedInterfaces] <String>]
 [-enableComponentMonitoring] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "UPDATEUSER"

## EXAMPLES

### EXAMPLE 1
```
Set-PVUser -destUser admin3 -password (read-host -AsSecureString)
```

Resets he password of user admin3 to the value provided.

### EXAMPLE 2
```
Set-PVUser -destUser zest3 -location \Location3
```

Moves vault user to Location3

## PARAMETERS

### -destUser
The name of the User to be updated.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Username

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -authType
The type of authentication by which the User will logon to the Vault.
Specify one of the following:
	PA_AUTH - Password authentication.
This is the default.
	NT_AUTH - NT authentication.
	NT_OR_PA_AUTH - Either password or NT authentication.
	PKI_AUTH - PKI authentication.
This requires a valid certfilename parameter.
	RADIUS_AUTH - Radius authentication.
This does not require any other
	additional parameters.
	LDAP_AUTH - LDAP authentication.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -requireSecurIDAuth
Whether or not the User is required to provide a SecurID passcode as well
as the method specified in the authtype parameter

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: requireSecureIDAuth

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -password
The password of the User to add to the Vault, if the authentication type
is PA_AUTH.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -certFileName
The name of the certificate file that enables users to log on with PKI
authentication.

Use either this parameter or 'dn'.
If Vault version is lower than version 3.5, this parameter must be specified.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DN
The User's Distinguished Name received from the directory or Certified Authority.
This parameter enables users to log on with PKI authentication.
Use either this parameter or 'CertFileName'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -location
The location from which the User will log on.
A backslash '\' must be added before the name of the location.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -usersAdmin
Whether or not the User can manage other Users

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -resetPassword
Whether or not the User can reset user's passwords or select 'User Must Change
Password at Next Logon' for other users.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -activateUsers
Whether or not the User can activate or deactivate user network areas.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -safesAdmin
Whether or not the User can manage Safes.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -networksAdmin
Whether or not the User can manage network settings

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -rulesAdmin
Whether or not the User can manage external user rules.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -categoriesAdmin
Whether or not the User can edit File Categories

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -auditAdmin
Indicates whether or not the User can audit users in the same location or sublocations
in the Vault hierarchy.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -backupAdmin
Whether or not the User can backup all the Safes in the Vault.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -restoreAdmin
Whether or not the User can restore all the Safes in the Vault.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -retention
The number of days to keep the User log records.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -firstName
The User's first name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -middleName
The User's middle name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -lastName
The User's last name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -quota
The disk quota that is allocated to the location in MB.
The specification '-1' indicates an unlimited quota allocation.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -disabled
Whether or not the User account is disabled.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -passwordNeverExpires
Whether or not the User's password never expires.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ChangePassword
Whether or not the User is required to change their password
after they logon for the first time.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -expirationDate
The date on which the User's account expires, if applicable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -homeStreet
The name of the street where the User lives.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -homeCity
The name of the city where the User lives.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -homeState
The name of the state where the User lives

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -homeCountry
The name of the country where the User lives.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -homeZIP
The zip code of the User's address.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -workPhone
The User's work phone number.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -homePhone
The User's home phone number.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -cellular
The User's cellular phone number.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -fax
The User's fax number.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -pager
The number of the User's pager

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -hEmail
The User's home e-mail address

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 23
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -bEmail
The User's business e-mail address.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -oEmail
Another e-mail address for the User.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -jobTitle
The User's job title.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 26
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -organization
The name of the User's organization.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 27
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -department
The name of the User's department.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 28
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -profession
The User's profession.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 29
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -workStreet
The street where the User's office is located.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 30
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -workCity
The city where the User's office is located.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 31
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -workState
The state where the User's office is located.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 32
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -workCountry
The country where the User's office is located.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 33
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -workZip
The zip code of the User's office address.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 34
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -homePage
The URL of the homepage of the User's company.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 35
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -notes
Optional notes about the User.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 36
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -userTypeName
The name of the user type allocated to this user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 37
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -authorizedInterfaces
The CyberArk interfaces that this user is authorized to use.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 38
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -enableComponentMonitoring
Whether or not email notifications are sent for component users who
have not accessed the Vault.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
