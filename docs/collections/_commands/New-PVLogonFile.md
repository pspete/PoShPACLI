---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: New-PVLogonFile
---

# New-PVLogonFile

## SYNOPSIS
This command creates a logon file that contains the information required
for a User to log onto the Vault.
After this file has been created, it
can be used with the Connect-PVVault command.

## SYNTAX

```
New-PVLogonFile [-logonFile] <String> [[-username] <String>] [[-password] <SecureString>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "CREATELOGONFILE"

## EXAMPLES

### EXAMPLE 1
```
New-PVLogonFile -logonFile D:\PACLI\cred.file -username administrator -password $password
```

Creates a new credential file, cred.file, which can be used for logon via Connect-PVVault.

## PARAMETERS

### -logonFile
The full pathname of the file that contains all the User information to
enable logon to the Vault

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -username
The username of the user carrying out the task on the external token

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

### -password
The password to save in the logon file that will allow logon to the Vault.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
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
