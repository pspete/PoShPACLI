---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVSafeEvent
---

# Get-PVSafeEvent

## SYNOPSIS
Lists Safe Events that are written in the current Safe.

## SYNTAX

```
Get-PVSafeEvent [[-safePatternName] <String>] [[-sourceIDList] <String>] [[-eventTypeIDList] <String>]
 [[-fromDate] <DateTime>] [[-dataSubstring] <String>] [[-numOfEvents] <Int32>] [-caseSensitive]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "SAFEEVENTSLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVSafeEvent -safePatternName UNIX_Safe
```

Retrieves safe events from UNIX_Safe

## PARAMETERS

### -safePatternName
A Safe name pattern to include in the returned Events list.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Safename

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -sourceIDList
A specific source ID for filtering the Events list.
If this parameter
is not specified, all the SourceId's will be included in the
returned Events list.
Note: This parameter has been deprecated.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -eventTypeIDList
An Event type ID for filtering the Events list.
If this parameter is
not specified, all the EventTypeId's will be included in the
returned Events list.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -fromDate
The first date to include in the returned Events list.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -dataSubstring
The string that is included in the Data field of the Event that will
be included in the returned Events list.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -numOfEvents
The number of recent Events to include in the returned Events list.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -caseSensitive
Whether or not the filter according to the 'datasubstring'
parameter will be case-sensitive.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
