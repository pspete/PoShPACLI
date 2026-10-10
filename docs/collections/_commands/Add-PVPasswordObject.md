---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVPasswordObject
---

# Add-PVPasswordObject

## SYNOPSIS
Stores a password object in the specified safe.

## SYNTAX

```
Add-PVPasswordObject [-safe] <String> [-folder] <String> [-file] <String> [-password] <SecureString>
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "STOREPASSWORDOBJECT"

## EXAMPLES

### EXAMPLE 1
```
Add-PVPasswordObject -safe Dev_Team -folder Root `
-file devpass -password (read-host -AsSecureString)
```

Adds password object with specified value to Dev_Team safe

## PARAMETERS

### -safe
The name of the Safe where the password object is stored

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
The name of the folder where the password object is stored.

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
The name of the password object.

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

### -password
The password being stored in the password object.

```yaml
Type: SecureString
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
