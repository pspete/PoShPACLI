---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Enable-PVTrustedNetworkArea
---

# Enable-PVTrustedNetworkArea

## SYNOPSIS
Activates a Trusted Network Area.

## SYNTAX

```
Enable-PVTrustedNetworkArea [-trusterName] <String> [-networkArea] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ACTIVATETRUSTEDNETWORKAREA"

## EXAMPLES

### EXAMPLE 1
```
Enable-PVTrustedNetworkArea -trusterName User2 -networkArea All
```

Enables the "All" trusted Network Area for USer2

## PARAMETERS

### -trusterName
The User who will have access to the Trusted Network Area

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

### -networkArea
The name of the Trusted Network Area to activate.

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
