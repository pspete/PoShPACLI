---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Find-PVFile
---

# Find-PVFile

## SYNOPSIS
Finds a particular file, list of files, password, or list of passwords,
according to the parameters set.

## SYNTAX

```
Find-PVFile [-safe] <String> [-folder] <String> [[-filePattern] <String>] [-fileRetrieved] [-fileChanged]
 [-fileNew] [-fileLocked] [-fileWithNoMark] [-includeVersions] [-onlyOpenSafes] [-includeSubFolders]
 [[-dateLimit] <String>] [[-dateActionLimit] <String>] [[-prevCount] <Int32>] [[-fromDate] <DateTime>]
 [[-toDate] <DateTime>] [-searchInAll] [[-searchInAllAction] <String>] [[-searchInAllValues] <String>]
 [[-searchInAllCategoryList] <String>] [[-listSeparator] <String>] [[-deletedOption] <String>]
 [[-sizeLimit] <Int32>] [[-sizeLimitType] <String>] [[-categoryIDList] <String>] [[-categoryValues] <String>]
 [[-categoryListAction] <String>] [-includeFileCategories] [[-fileCategoriesSeparator] <String>]
 [[-fileCategoryValuesSeparator] <String>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "FINDFILES"

## EXAMPLES

### EXAMPLE 1
```
Find-PVFile -safe Reports -folder root
```

Finds all files in the root folder of Reports safe.

## PARAMETERS

### -safe
The name of the Safe containing the file(s) or password(s)
you are looking for.
You can use a wildcard to specify a
wider range of safenames.

```yaml
Type: String
Parameter Sets: (All)
Aliases: safename

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -folder
The name of the folder containing the file(s) or password(s)
to be found.

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

### -filePattern
The full name or part of the name of the file(s) or
password(s) to list.
Alternatively, a wildcard can be used in
this parameter.

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

### -fileRetrieved
Whether or not the report will include retrieved files or
passwords.

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

### -fileChanged
Whether or not the report will include modified files or
passwords.

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

### -fileNew
Whether or not the report will include new files or
passwords.

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

### -fileLocked
Whether or not the report will include locked files or
passwords.

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

### -fileWithNoMark
Whether or not the report will include files or passwords
without an access mark.

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

### -includeVersions
Whether or not the report will include previous versions of
included files or passwords.

Note: If the value is set to NO, the 'deletedoption'
parameter cannot be set to INCLUDE_DELETED.

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

### -onlyOpenSafes
Whether or not the report will search only Safes that are
currently open

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

### -includeSubFolders
Whether or not the search will include subfolders.

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

### -dateLimit
A specific time duration.
Possible values are:
	NONE
	BETWEEN which is qualified by \[fromdate\] and \[todate\].
	PREVMONTH which is qualified by \[prevcount\].
	PREVDAY which is qualified by \[prevcount\].

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

### -dateActionLimit
The activity that took place during the period specified in
\[datelimit\].
Possible values are:
	ACCESSEDFILE
	CREATED
	MODIFIED

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

### -prevCount
The number of days or months to be included in the report if
\[datelimit\] is specified as 'PREVMONTH' or 'PREVDAY'.

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

### -fromDate
The first day to be included in the report if \[datelimit\] is
specified as 'BETWEEN'.
Use the following date format:
	dd/mm/yyyy.

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

### -toDate
The last day to be included in the report if \[datelimit\] is
specified as 'BETWEEN'.
Use the following date format:
	dd/mm/yyyy.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -searchInAll
Whether or not the report will only include files or passwords
that contain the values specified in the 'searchinallvalues'
parameter in their Safe, folder or file/password name, or in
one of their file categories, as specified in the
'searchinallcategorylist' parameter.

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

### -searchInAllAction
The way that the values in the 'searchinallvalues' parameter
will be searched for if the 'searchinall' parameter is set to
'YES'.
Possible values are:
	'OR' - at least one of the values in the list needs to be
	found.
	'AND' - all the values in the list need to be found.

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

### -searchInAllValues
A list of values that should be searched for when the
'searchinall' parameter is set to 'YES'.
The values in the list
must be separated by the character specified in the
'listseparator' parameter.

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

### -searchInAllCategoryList
A list of category names to search in when the 'searchinall'
parameter is set to 'YES'.
The values in the list must be
separated by the character specified in the 'listseparator'
parameter.

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

### -listSeparator
A character that will be used to separate the values in the
'searchinallvalues', 'searchinallcategorylist', 'categoryidlist',
and 'categoryvalues' parameters.
The default value is ","
(comma).

Note: When a string with more than one character is
specified, only the first character will be used.

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

### -deletedOption
Whether or not deleted files will be shown in the report.
Possible values are:
	INCLUDE_DELETED_WITH_ACCESSMARKS (default value)
	INCLUDE_DELETED
	ONLY_DELETED
	WITHOUT_DELETED

Note: If the value is set to INCLUDE_DELETED, the
'includeversions' parameter cannot be set to NO.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -sizeLimit
The file or password size limit in KB for the search, based
on the 'sizelimittype' parameter.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -sizeLimitType
The type of file or password size-based search.
Possible
values are:
	ATLEAST
	ATMOST

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -categoryIDList
A list of category IDs according to which the values
specified in the 'categoryvalues' parameter will be searched
for.

Note: The first value corresponds to the first category, the
second value to the second category, etc.
Only files or passwords that contain the specified file
categories (according to the 'categorylistaction' parameter)
with the specified values will be returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -categoryValues
A list of values to search for in the file categories specified
in the 'categoryidlist' parameter.

Note: The first value corresponds to the first category, the
second value to the second category, etc.
Only files or passwords that contain the listed file categories
(according to the 'categorylistaction' parameter) with the
specified values will be returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -categoryListAction
Specifies how to search for the values in the 'categoryidlist'
and 'categoryvalues' parameters.
Possible values are:
	'OR' - at least one of the values in the list needs to be
	found.
	'AND' - all the values in the list need to be found.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -includeFileCategories
Whether or not the search will include file categories in the
output.

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

### -fileCategoriesSeparator
Character to be written in the search output to separate the
file categories.
The default value is '#'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -fileCategoryValuesSeparator
Character to be written in the search output to separate the
file categories and their values.
The default value is ':'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
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
