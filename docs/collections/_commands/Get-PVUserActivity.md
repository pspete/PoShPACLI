---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVUserActivity
---

# Get-PVUserActivity

## SYNOPSIS
This command generates a list of activities carried out in the specified
Vault for the user who issues this command.
The Safes included in the output are those to which the User carrying out
the command has authorization.

## SYNTAX

```
Get-PVUserActivity [[-logDays] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "INSPECTUSER"

## EXAMPLES

### EXAMPLE 1
```
Get-PVUserActivity -logDays 5
```

Lists vault user activity from the last 5 days

## PARAMETERS

### -logDays
The number of days to include in the list of activities.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
