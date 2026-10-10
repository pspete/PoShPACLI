---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Rename-PVLocation
---

# Rename-PVLocation

## SYNOPSIS
Renames a Location.

## SYNTAX

```
Rename-PVLocation [-location] <String> [-newName] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "RENAMELOCATION"

## EXAMPLES

### EXAMPLE 1
```
Rename-PVLocation -location \Location2 -newName \Location3
```

Renames Location2 to Location3 in the vault

## PARAMETERS

### -location
The current name of the Location to rename.
Note: Add a backslash '\' before the name of the location

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

### -newName
The new name of the Location.

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
