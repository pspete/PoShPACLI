---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVFileList
---

# Get-PVFileList

## SYNOPSIS
Produces a list of files or passwords in the specified Safe that match
the criteria that is declared.

## SYNTAX

```
Get-PVFileList [-safe] <String> [-folder] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "FILESLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVFileList -safe Reports -folder root
```

Lists files in the Reports safe

## PARAMETERS

### -safe
The name of the Safe containing the files to list.

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
The name of the folder containing the files to list.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
