---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Move-PVNetworkArea
---

# Move-PVNetworkArea

## SYNOPSIS
Moves a Network Area to a new location in the Network Areas tree.

## SYNTAX

```
Move-PVNetworkArea [-networkArea] <String> [-newLocation] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "MOVENETWORKAREA"

## EXAMPLES

### EXAMPLE 1
```
Move-PVNetworkArea -networkArea All\DE -newLocation ALL\EMEA\DE
```

Moves Network Area DE to EMEA\DE

## PARAMETERS

### -networkArea
The name of the Network Area.

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

### -newLocation
The new location of the Network Area.
Note: Add a backslash '\' before the name of the location.

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
