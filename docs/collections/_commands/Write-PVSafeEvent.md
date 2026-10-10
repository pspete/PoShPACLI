---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Write-PVSafeEvent
---

# Write-PVSafeEvent

## SYNOPSIS
Adds a new application Event manually to the current Safe.

## SYNTAX

```
Write-PVSafeEvent [-safe] <String> [-sourceID] <String> [-eventTypeID] <String> [-data] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDEVENT"

## EXAMPLES

### EXAMPLE 1
```
Write-PVSafeEvent -safe Windows_Safe -sourceID 9999 -eventTypeID 9000 `
-data "Event Data"
```

Adds event to safe Windows_Safe

## PARAMETERS

### -safe
The name of the Safe where the Event is saved.

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

### -sourceID
The unique source ID number that represents the application that
added the Event to the Events log in the Safe.

Note: Before adding your own type of events, contact your
CyberArk support representative to receive a unique SourceID
identifier.

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

### -eventTypeID
A unique ID of the type of Event written to the Events log, specific to
the application that carried out the event.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -data
A free text field that specifies details about the Event.

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
