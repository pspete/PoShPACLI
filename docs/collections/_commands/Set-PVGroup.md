---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Set-PVGroup
---

# Set-PVGroup

## SYNOPSIS
Updates CyberArk Group properties.

## SYNTAX

```
Set-PVGroup [-group] <String> [-location] <String> [[-description] <String>] [[-externalGroup] <String>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "UPDATEGROUP"

## EXAMPLES

### EXAMPLE 1
```
Set-PVGroup -group group1 -location \ -description "New Description"
```

Sets new description on vault group 1

## PARAMETERS

### -group
The name of the group to update.

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

### -location
The name of the location containing the group
Note: Add a backslash '\' before the name of the location.

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

### -description
The description of the group.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -externalGroup
The name of an external group that is a member in the current group.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
