---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVSafeActivity
---

# Get-PVSafeActivity

## SYNOPSIS
Produces a list of activities of all the Safe Owners of the specified
Safe(s).

## SYNTAX

```
Get-PVSafeActivity [-safePattern] <String> [-userPattern] <String> [[-logdays] <Int32>] [-alertsOnly]
 [[-fileName] <String>] [[-codes] <String>] [[-fromDate] <DateTime>] [[-toDate] <DateTime>]
 [[-requestID] <String>] [[-categoriesNames] <String>] [[-categoriesValues] <String>]
 [[-categoriesSeperator] <String>] [[-categoryFilterType] <String>] [[-maxRecords] <Int32>]
 [[-userType] <String>] [[-options] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "INSPECTSAFE"

## EXAMPLES

### EXAMPLE 1
```
Get-PVSafeActivity -safePattern unix_safe -userPattern *
```

Gets safe activity for all users from safe unix_safe

## PARAMETERS

### -safePattern
The full name or part of the name of the Safe(s) to include in the report.
Alternatively, a wildcard can be used in this parameter.
The default is '*' (wildcard).

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

### -userPattern
The full name or part of the name of the Owner(s) to include in the list.
Alternatively, a wildcard can be used in this parameter.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Username

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -logdays
The number of days to include in the list of activities.
The default is '-1', meaning that all the days registered in the log will be included.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -alertsOnly
Whether or not the activities list will contain only alerts or every activity.
The default is 'NO'.

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

### -fileName
The full path name of the file where the log records will be saved.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -codes
The message codes that will be used to filter the log activities.
Multiple codes are separated by commas.

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

### -fromDate
The first day to be included in the list of activities.
Use the following date format: dd/mm/yyyy.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -toDate
The last day to be included in the list of activities.
Use the following date format: dd/mm/yyyy.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -requestID
The unique ID of a request in the list of activities.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -categoriesNames
The name of the categories to include in the list.

Separate multiple category names with the value of the
CATEGORIESSEPERATOR parameter.

Specify a corresponding value for each category name in the
CATEGORIESVALUE parameter.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -categoriesValues
The value of each category specified in the CATEGORIESNAMES parameter.

Separate multiple category names with the value of the
CATEGORIESSEPERATOR parameter.

Specify a corresponding value for each category in the
CATEGORIESNAME parameter.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -categoriesSeperator
The separator between multiple category names and multiple category values.
The default is ',' (comma).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -categoryFilterType
The type of category filter.
Possible values are:
AND - Categories will be filtered according to all the
specified filters.
OR - Categories will be filtered according to one of the
specified categories.
The default is 'AND'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -maxRecords
The maximum number of records to retrieve.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -userType
The user type to use to filter activities.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -options
The INSPECTSAFE options.
Possible values are:
1 - Returns the results in descending order.
2 - Indicates the user pattern is in regular expression.
4 - Uses negation for user pattern regular expression.
16 - Displays only an external audit.
32 - Displays only an internal audit.
64 - Sort according to external time.
128 - The user pattern is the exact string, not a wildcard
or regular expression.
256 - Shows system audit.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
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
