---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Remove-PVFileCategory
---

# Remove-PVFileCategory

## SYNOPSIS
Deletes a category from a file or password's File Categories.

## SYNTAX

```
Remove-PVFileCategory [-safe] <String> [-folder] <String> [-file] <String> [-category] <String> [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "DELETEFILECATEGORY"

## EXAMPLES

### EXAMPLE 1
```
Remove-PVFileCategory -safe ORACLE -folder root -file sys.pass `
-category AccountCategory
```

Deletes AccountCategory file category from sys.pass file

## PARAMETERS

### -safe
The name of the Safe where the File Category is being deleted.

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
The folder containing a file with a File Category attached to it.

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

### -file
The name of the file or password that is attached to a File Category.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Filename

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -category
The name of the File Category.

```yaml
Type: String
Parameter Sets: (All)
Aliases: CategoryName

Required: True
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
