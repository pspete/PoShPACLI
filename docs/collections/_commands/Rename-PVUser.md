---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Rename-PVUser
---

# Rename-PVUser

## SYNOPSIS
Renames a CyberArk User

## SYNTAX

```
Rename-PVUser [-destUser] <String> [-newName] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "RENAMEUSER"

## EXAMPLES

### EXAMPLE 1
```
Rename-PVUser -destUser Then -newName Now
```

Renames user "Then" to user "Now"

## PARAMETERS

### -destUser
The current name of the User to rename.

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

### -newName
The new name of the User.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
