---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: New-PVLocation
---

# New-PVLocation

## SYNOPSIS
Adds a location to the Vault.

## SYNTAX

```
New-PVLocation [-location] <String> [[-quota] <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDLOCATION"

## EXAMPLES

### EXAMPLE 1
```
New-PVLocation -location \x51
```

Adds location x51 to Vault root

## PARAMETERS

### -location
The name of the location to add.
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

### -quota
The size of the quota to allocate to the location in MB.
The specification '-1' indicates an unlimited quota allocation.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
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
