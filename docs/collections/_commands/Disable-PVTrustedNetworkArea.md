---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Disable-PVTrustedNetworkArea
---

# Disable-PVTrustedNetworkArea

## SYNOPSIS
Deactivates a Trusted Network Area.

## SYNTAX

```
Disable-PVTrustedNetworkArea [-trusterName] <String> [-networkArea] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "DEACTIVATETRUSTEDNETWORKAREA"

## EXAMPLES

### EXAMPLE 1
```
Disable-PVTrustedNetworkArea -trusterName user2 -networkArea All
```

Disables the "All" Trusted Network Area for user2

## PARAMETERS

### -trusterName
The User who will not have access to the Trusted Network Area.

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
The name of the Network Area to deactivate.

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
