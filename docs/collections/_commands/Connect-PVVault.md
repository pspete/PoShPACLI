---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Connect-PVVault
---

# Connect-PVVault

## SYNOPSIS
This command enables you to log onto the Vault.

## SYNTAX

```
Connect-PVVault [-user] <String> [[-password] <SecureString>] [[-newPassword] <SecureString>]
 [[-logonFile] <String>] [-autoChangePassword] [-failIfConnected] [-radius] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "LOGON"
Either log onto the Vault with this function by specifying a username and
password or by using an authentication parameter file.
To create this file,
see the New-PVLogonFile command.

## EXAMPLES

### EXAMPLE 1
```
Connect-PVVault -user User1 -password (read-host -AsSecureString)
```

Logs onto defined vault using User1

## PARAMETERS

### -user
The Username of the User logging on

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -password
The User's password (as a Secure String).
Note: The LOGONFILE and PASSWORD parameters cannot be defined together.
Warning: PACLI receives the password in clear text on its process command
line, where it may be captured by process auditing or monitoring tools.
Use a logon file to avoid this.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -newPassword
The User's new password (as a Secure String); (if the User would like to change password at
logon time) or NULL.
Note: The LOGONFILE and NEWPASSWORD parameters cannot be defined together.

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

### -logonFile
The full pathname of the logon parameter file which contains the User's
name and scrambled password.
Note: The logonfile parameter cannot be defined with the RADIUS, PASSWORD,
or NEWPASSWORD parameters.

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

### -autoChangePassword
Determines whether or not the password is automatically changed each time
the User logs onto the Vault.
It is only relevant when you use the LogonFile parameter of the
CreateLogonFile command.
It will generate a randomized new password, change to the new password on
logon, and will save it to the  authentication file after a successful logon.

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

### -failIfConnected
Whether or not to disconnect the session if the user is already logged onto
the Vault through a different interface

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

### -radius
Whether or not to enable Radius authentication to the Vault.
Notes:
PACLI does not support challenge response for RADIUS authentication.
The logonfile and radius parameters cannot be defined in the same command.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
