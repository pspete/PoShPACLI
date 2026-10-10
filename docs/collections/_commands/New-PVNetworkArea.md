---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: New-PVNetworkArea
---

# New-PVNetworkArea

## SYNOPSIS
Adds a new Network Area to the CyberArk Vault environment.

## SYNTAX

```
New-PVNetworkArea [-networkArea] <String> [[-securityLevelParm] <SecurityLevel>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDNETWORKAREA"

## EXAMPLES

### EXAMPLE 1
```
New-PVNetworkArea -networkArea All\EMEA
```

Adds EMEA Network Area

### EXAMPLE 2
```
New-PVNetworkArea -networkArea All\APAC -securityLevelParm Internal, HighlySecured
```

Adds APAC Network Area with the internal & Highly Secured Network Area security flags

## PARAMETERS

### -networkArea
The name of the new Network Area.

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

### -securityLevelParm
Specify the Network Area security flags.
Valid values are combinations of the following:
Locations: Internal, External, Public.
Security Areas: HighlySecured, Secured, Unsecured

```yaml
Type: SecurityLevel
Parameter Sets: (All)
Aliases:
Accepted values: Internal, External, Public, HighlySecured, Secured, Unsecured

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
