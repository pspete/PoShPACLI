---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Import-PVVaultDefinition
---

# Import-PVVaultDefinition

## SYNOPSIS
Defines a new Vault with parameters that reside in a text file.

## SYNTAX

```
Import-PVVaultDefinition [-parmFile] <String> [-vault] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "DEFINEFROMFILE"

## EXAMPLES

### EXAMPLE 1
```
Import-PVVaultDefinition -parmFile D:\PACLI\Vault.ini -vault "DemoVault"
```

Defines a new vault connection using the details specified in the Vault.ini parameter file.

## PARAMETERS

### -parmFile
The full pathname of the file containing the parameters for
defining the Vault.

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

### -vault
The name of the Vault to create.
This overrides any Vault name specyfied in the vault parameter file.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
