---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVGroup
---

# Get-PVGroup

## SYNOPSIS
Returns details of a CyberArk group.

## SYNTAX

```
Get-PVGroup [-group] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "GROUPDETAILS"

## EXAMPLES

### EXAMPLE 1
```
Get-PVGroup -group cybr_admins
```

Lists details for cybr_admins group

## PARAMETERS

### -group
The name of the group

```yaml
Type: String
Parameter Sets: (All)
Aliases: Groupname

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
