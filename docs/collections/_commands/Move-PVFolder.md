---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Move-PVFolder
---

# Move-PVFolder

## SYNOPSIS
Moves a folder to a different location within the same Safe.

## SYNTAX

```
Move-PVFolder [-safe] <String> [-folder] <String> [-newLocation] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "MOVEFOLDER"

## EXAMPLES

### EXAMPLE 1
```
Move-PVFolder -safe ComplianceReports -folder root\reports\2017 `
-newLocation root
```

Moves folder "2017"to the root location of the safe

## PARAMETERS

### -safe
The name of the Safe containing the folder to move.

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

### -folder
The name of the folder.

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

### -newLocation
The new location of the folder.
Note: Add a backslash '\' before the name of the location.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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
