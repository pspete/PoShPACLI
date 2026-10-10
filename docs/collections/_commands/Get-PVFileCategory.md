---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVFileCategory
---

# Get-PVFileCategory

## SYNOPSIS
Lists all the File Categories at both Vault and Safe level for the
specified file or password.

## SYNTAX

```
Get-PVFileCategory [-safe] <String> [-folder] <String> [-file] <String> [[-category] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "LISTFILECATEGORIES"

## EXAMPLES

### EXAMPLE 1
```
Get-PVFileCategory -safe DEV -folder Root -file TeamPass
```

Lists file categories on file TeamPass in safe DEV.

## PARAMETERS

### -safe
The name of the Safe that the File Category is attached to.

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
Aliases:

Required: False
Position: 4
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
