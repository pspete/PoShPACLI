---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVUserSafeList
---

# Get-PVUserSafeList

## SYNOPSIS
Lists of the Safes to which the specified Safe Owner has ownership.

## SYNTAX

```
Get-PVUserSafeList [-owner] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "OWNERSAFESLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVUserSafeList -owner sec_admin
```

Lists safes owned by user sec_admin

## PARAMETERS

### -owner
The name of the Safe Owner.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
