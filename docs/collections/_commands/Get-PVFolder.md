---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVFolder
---

# Get-PVFolder

## SYNOPSIS
Lists folders in the specified Safe.

## SYNTAX

```
Get-PVFolder [-safe] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "FOLDERSLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVFolder -safe ORACLE
```

Lists all folders in the specified safe.

## PARAMETERS

### -safe
The name of the Safe whose folders will be listed.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Safename

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
