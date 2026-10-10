---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVFileActivity
---

# Get-PVFileActivity

## SYNOPSIS
Inspect activity that has taken place in a specified Safe.

## SYNTAX

```
Get-PVFileActivity [-safe] <String> [-folder] <String> [-file] <String> [[-logDays] <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "INSPECTFILE"

## EXAMPLES

### EXAMPLE 1
```
Get-PVFileActivity -safe PROD -folder root -file prodpass
```

Lists file activity for prodpass in safe PROD

## PARAMETERS

### -safe
The name of the Safe containing the file.

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
The folder containing the file whose activity will be listed.

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
The name of the file or password whose activity will be listed.

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

### -logDays
The number of days to include in the list of activities.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
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
