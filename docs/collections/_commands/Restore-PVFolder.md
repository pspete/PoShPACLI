---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Restore-PVFolder
---

# Restore-PVFolder

## SYNOPSIS
Undeletes a deleted folder in a Safe.
A folder can only be undeleted if
the Safe History retention period has not expired for all activity in
the folder.

## SYNTAX

```
Restore-PVFolder [-safe] <String> [-folder] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "UNDELETEFOLDER"

## EXAMPLES

### EXAMPLE 1
```
Restore-PVFolder -safe ASIAPAC -folder root\MFA
```

Restores deleted MFA Folder to ASIAPAC safe

## PARAMETERS

### -safe
The name of the Safe in which the folder will be undeleted.

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
The name of the folder to undelete.

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
