---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVTrustedNetworkArea
---

# Get-PVTrustedNetworkArea

## SYNOPSIS
Lists Trusted Network Areas

## SYNTAX

```
Get-PVTrustedNetworkArea [-trusterName] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "TRUSTEDNETWORKAREASLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVTrustedNetworkArea -trusterName lydia
```

Lists Trusted Network Areas for user lydia

## PARAMETERS

### -trusterName
The User who has access to the Trusted Network Area

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
