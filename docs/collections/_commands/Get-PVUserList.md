---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVUserList
---

# Get-PVUserList

## SYNOPSIS
Produces a list of Users who have access to the specified Vault.
You can only generate this list if you have administrative permissions.

## SYNTAX

```
Get-PVUserList [[-location] <String>] [-includeSubLocations] [-includeDisabledUsers] [-onlyKnownUsers]
 [[-userPattern] <String>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "USERSLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVUserList  | Where-Object{$_.LDAPUser -eq "YES"}
```

Returns all LDAP users/groups from vault

## PARAMETERS

### -location
The location to search for users.
Note: A backslash '\' must be added before the name of the location.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -includeSubLocations
Whether or not the output will include the sublocation in which the User
is defined.

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

### -includeDisabledUsers
Whether or not the output will include disabled users

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

### -onlyKnownUsers
Whether or not the output will include only Users who share Safes with
the User carrying out the command or all Users known by the specified Vault

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

### -userPattern
The full name or part of the name of the User(s) to include in the report.
A wildcard can also be used in this parameter.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
