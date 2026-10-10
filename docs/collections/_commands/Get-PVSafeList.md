---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVSafeList
---

# Get-PVSafeList

## SYNOPSIS
Produces a list of Safes in the specified Vault

## SYNTAX

```
Get-PVSafeList [[-location] <String>] [-includeSubLocations] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "SAFESLIST

## EXAMPLES

### EXAMPLE 1
```
Get-PVSafeList -location \
```

Lists all safes from the root location of the vault

## PARAMETERS

### -location
The location to search in for the Safes to include in the list.
Note: Add a backslash '\' before the name of the location.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -includeSubLocations
Whether or not in include sublocation(s) of the specified location in
the list.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
