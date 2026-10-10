---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVUserPhoto
---

# Get-PVUserPhoto

## SYNOPSIS
Retrieves the photograph of the specified CyberArk User from the Vault

## SYNTAX

```
Get-PVUserPhoto [-destUser] <String> [-localFolder] <String> [-localFile] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "GETUSERPHOTO"

## EXAMPLES

### EXAMPLE 1
```
Get-PVUserPhoto -destUser user1 -localFolder D:\userphotos `
-localFile userphoto.jpg
```

Saves photo set on user account user1 to local drive

## PARAMETERS

### -destUser
The name of the User whose photo you wish to retrieve.

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

### -localFolder
The path of the folder in which the photograph is stored

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

### -localFile
The name of the file in which the photograph is stored

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
