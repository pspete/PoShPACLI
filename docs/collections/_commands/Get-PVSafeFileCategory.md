---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVSafeFileCategory
---

# Get-PVSafeFileCategory

## SYNOPSIS
Lists all the File Categories that are available in the specified Safe

## SYNTAX

```
Get-PVSafeFileCategory [[-safe] <String>] [[-category] <String>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "LISTSAFEFILECATEGORIES"

## EXAMPLES

### EXAMPLE 1
```
Get-PVSafeFileCategory -safe ORACLE -category CISOcat1
```

lists specific file category details

### EXAMPLE 2
```
Get-PVSafeFileCategory -safe ORACLE
```

lists all file category details

## PARAMETERS

### -safe
The Safe where the File Categories is defined.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Safename

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -category
The name of the File Category to list.

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
