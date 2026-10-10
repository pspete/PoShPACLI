---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Move-PVFile
---

# Move-PVFile

## SYNOPSIS
Moves a file or password to a different folder within the same Safe.

## SYNTAX

```
Move-PVFile [-safe] <String> [-folder] <String> [-file] <String> [-newFolder] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "MOVEFILE"

## EXAMPLES

### EXAMPLE 1
```
Move-PVFile -safe AuditReports -folder root -file Report1 `
-newFolder root\reports
```

Move file Report1 to Reports folder within AuditReports safe.

## PARAMETERS

### -safe
The name of the Safe in which the file is stored.

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
The name of the folder in which the file is stored.

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
The name of the file or password to move.

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

### -newFolder
The name of the folder into which the file will be moved.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
