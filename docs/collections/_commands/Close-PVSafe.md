---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Close-PVSafe
---

# Close-PVSafe

## SYNOPSIS
Closes a Safe

## SYNTAX

```
Close-PVSafe [-safe] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "CLOSESAFE"

## EXAMPLES

### EXAMPLE 1
```
Close-PVSafe -safe system
```

Closes the SYSTEM safe

## PARAMETERS

### -safe
The name of the Safe to close.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
