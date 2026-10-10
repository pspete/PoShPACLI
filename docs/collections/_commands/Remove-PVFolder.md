---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Remove-PVFolder
---

# Remove-PVFolder

## SYNOPSIS
Deletes a folder from an open Safe.
A folder can only be deleted if the
Safe History retention period has expired for all activity in the folder.

## SYNTAX

```
Remove-PVFolder [-safe] <String> [-folder] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "DELETEFOLDER"

## EXAMPLES

### EXAMPLE 1
```
Remove-PVFolder -safe Reports -folder root\2017
```

Deletes folder "2017" from Reports safe

## PARAMETERS

### -safe
The name of the Safe in which the folder will be deleted.

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

### -folder
The name of the folder to delete.

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
