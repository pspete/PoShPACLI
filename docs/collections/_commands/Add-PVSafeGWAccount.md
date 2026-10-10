---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVSafeGWAccount
---

# Add-PVSafeGWAccount

## SYNOPSIS
Shares a Safe through a Gateway account

## SYNTAX

```
Add-PVSafeGWAccount [-safe] <String> [-gwAccount] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDSAFESHARE"

## EXAMPLES

### EXAMPLE 1
```
Add-PVSafeGWAccount -safe Team_Safe -gwAccount PVWAGWUser
```

Adds Gateway account PVWAGWUser to shared safe Team_Safe.

## PARAMETERS

### -safe
The Safe to share through the Gateway

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

### -gwAccount
The name of the Gateway account through which the Safe is shared

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
