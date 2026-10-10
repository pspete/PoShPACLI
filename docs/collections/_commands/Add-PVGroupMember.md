---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVGroupMember
---

# Add-PVGroupMember

## SYNOPSIS
Adds a CyberArk User to an existing CyberArk group

## SYNTAX

```
Add-PVGroupMember [-group] <String> [-member] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDGROUPMEMBER"

## EXAMPLES

### EXAMPLE 1
```
Add-PVGroupMember -group xGroup1 -member xUser1
```

Adds user xUser1 to group xGroup1

## PARAMETERS

### -group
The name of the group.

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

### -member
The name of the User to add to the group.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Username

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
