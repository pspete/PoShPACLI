---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Remove-PVSafe
---

# Remove-PVSafe

## SYNOPSIS
Delete a Safe.
It is only possible to delete a Safe after the version
retention period has expired for all files contained in the Safe.
In order to carry out this command successfully, the Safe must be open.

## SYNTAX

```
Remove-PVSafe [-safe] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "DELETESAFE"
A deleted Safe cannot be recovered, make sure that any files that are stored
within it are not required as they will be deleted.
A detailed description of the function or script.
This keyword can be
used only once in each topic.

## EXAMPLES

### EXAMPLE 1
```
Remove-PVSafe -safe Old_Safe
```

Deletes safe Old_Safe

## PARAMETERS

### -safe
The name of the Safe to delete.

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
