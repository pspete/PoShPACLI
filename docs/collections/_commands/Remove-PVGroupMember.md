---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Remove-PVGroupMember
---

# Remove-PVGroupMember

## SYNOPSIS
Removes a User as a member from a CyberArk group.

## SYNTAX

```
Remove-PVGroupMember [-group] <String> [-member] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "DELETEGROUPMEMBER"

## EXAMPLES

### EXAMPLE 1
```
Remove-PVGroupMember -group auditors -member WebService
```

Deletes "WebService" as a member of vault group "Auditors"

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
The name of the group member to delete

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
