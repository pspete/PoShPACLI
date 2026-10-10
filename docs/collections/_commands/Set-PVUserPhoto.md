---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Set-PVUserPhoto
---

# Set-PVUserPhoto

## SYNOPSIS
Saves a User's photo in the Vault.

## SYNTAX

```
Set-PVUserPhoto [-destUser] <String> [-localFolder] <String> [-localFile] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "PUTUSERPHOTO"

## EXAMPLES

### EXAMPLE 1
```
Set-PVUserPhoto -destUser user1 -localFolder D:\ -localFile photo.jpg
```

Sets D:\photo.jpg as user photo for vault user user1

## PARAMETERS

### -destUser
The name of the User in the photograph.

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
The location of the folder in which the photograph is stored

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
