---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVRequestStatus
---

# Get-PVRequestStatus

## SYNOPSIS
Displays the status of confirmation for a specific request.

## SYNTAX

```
Get-PVRequestStatus [-safe] <String> [-requestID] <Int32> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "REQUESTCONFIRMATIONSTATUS"

## EXAMPLES

### EXAMPLE 1
```
Get-PVRequestStatus -safe EU_Safe -requestID 30
```

Returns status of request with ID 38 in EU_Safe

## PARAMETERS

### -safe
The name of the Safe for which the request has been created.

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

### -requestID
The unique ID number of the request.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
