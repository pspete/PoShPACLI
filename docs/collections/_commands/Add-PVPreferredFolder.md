---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVPreferredFolder
---

# Add-PVPreferredFolder

## SYNOPSIS
Enables specification of a preferred folder in a Safe.

## SYNTAX

```
Add-PVPreferredFolder [-safe] <String> [-folder] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDPREFERREDFOLDER"

## EXAMPLES

### EXAMPLE 1
```
Add-PVPreferredFolder -safe AuditReports -folder root\reports\2017
```

Sets preferred folder in AuditReports safe.

## PARAMETERS

### -safe
The name of the Safe containing the folder to mark.

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
The name of the folder to mark as a preferred folder.

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
