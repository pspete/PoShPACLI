---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVRule
---

# Get-PVRule

## SYNOPSIS
Lists all the service rules in a specified Safe.

## SYNTAX

```
Get-PVRule [-safeName] <String> [-fullObjectname] <String> [-isFolder] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "RULESLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVRule -safeName UNIX -fullObjectname root\rootpass -isFolder $false
```

Lists OLAC rules for rootpass

## PARAMETERS

### -safeName
The Safe where the rules are applied.

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

### -fullObjectname
The file, password, or folder that the rule applies to.

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

### -isFolder
Whether the rule applies to files and passwords or for folders.
	NO - Indicates files and passwords
	YES - Indicates folders

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
