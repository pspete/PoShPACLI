---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVUser
---

# Get-PVUser

## SYNOPSIS
Returns details about a specific CyberArk User.

## SYNTAX

```
Get-PVUser [-destUser] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "USERDETAILS"

## EXAMPLES

### EXAMPLE 1
```
Get-PVUser -destUser zEST1
```

Lists properties of vault user zEST1

## PARAMETERS

### -destUser
The name of the User whose details will be listed.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Username

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
