---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVSafeOwner
---

# Get-PVSafeOwner

## SYNOPSIS
Produces a list of all the Safe Owners of the specified Safe(s).

## SYNTAX

```
Get-PVSafeOwner [-safePattern] <String> [-ownerPattern] <String> [-includeGroupMembers] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "OWNERSLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVSafeOwner -safePattern system -ownerPattern *
```

Lists all owners of the SYSTEM safe

## PARAMETERS

### -safePattern
The full name or part of the name of the Safe(s) to include in the list.
Alternatively, a wildcard can be used in this parameter.

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

### -ownerPattern
The full name or part of the name of the Owner(s) to include in the list.
Alternatively, a wildcard can be used in this parameter.

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

### -includeGroupMembers
Whether or not to include individual members of Groups in the list.

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
