---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Unlock-PVUser
---

# Unlock-PVUser

## SYNOPSIS
Unlocks the User account of the CyberArk User who is currently logged on.

## SYNTAX

```
Unlock-PVUser [[-password] <SecureString>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "UNLOCK"

## EXAMPLES

### EXAMPLE 1
```
Unlock-PVUser -password (read-host -AsSecureString)
```

Unlocks the current user, after supplying password for the account.

## PARAMETERS

### -password
The User's password

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
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
