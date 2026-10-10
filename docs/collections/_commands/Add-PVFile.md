---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVFile
---

# Add-PVFile

## SYNOPSIS
Stores a file, that is currently on your local computer, in a secure
location in a Safe.

## SYNTAX

```
Add-PVFile [-safe] <String> [-folder] <String> [-file] <String> [-localFolder] <String> [-localFile] <String>
 [-deleteMacros] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "STOREFILE"

## EXAMPLES

### EXAMPLE 1
```
Add-PVFile -safe caTools -folder Root -file pacli.exe `
-localFolder D:\PACLI -localFile pacli.exe
```

Stores local file, pacli.exe in the caTools safe

## PARAMETERS

### -safe
The name of the Safe where the file will be stored.

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
The folder in the Safe where the file will be stored.

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

### -file
The name of the file as it will be stored in the Safe.

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

### -localFolder
The location on the User's terminal where the file is currently
located.

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

### -localFile
The name of the file to be stored in the Vault as it is on the User's
terminal.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -deleteMacros
Delete macros from the file

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
