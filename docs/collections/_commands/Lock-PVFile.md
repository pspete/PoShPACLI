---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Lock-PVFile
---

# Lock-PVFile

## SYNOPSIS
Locks a file or password, preventing other Users from retrieving it.

## SYNTAX

```
Lock-PVFile [-safe] <String> [-folder] <String> [-file] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "LOCKFILE"

## EXAMPLES

### EXAMPLE 1
```
Lock-PVFile -safe ORACLE -folder root -file SYSpass
```

Locks file SYSpass in ORACLE safe.

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
The name of the file or password to lock.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
