---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Rename-PVSafe
---

# Rename-PVSafe

## SYNOPSIS
Renames a Safe

## SYNTAX

```
Rename-PVSafe [-safe] <String> [-newName] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "RENAMESAFE"

## EXAMPLES

### EXAMPLE 1
```
Rename-PVSafe -safe oldName -newName newName
```

Renames safe oldName to newName

## PARAMETERS

### -safe
The current name of the Safe.

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

### -newName
The new name of the Safe.

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
