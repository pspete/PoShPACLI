---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVExternalUser
---

# Add-PVExternalUser

## SYNOPSIS
Adds a new user from an external directory

## SYNTAX

```
Add-PVExternalUser [-destUser] <String> [[-ldapFullDN] <String>] [-ldapDirectory] <String> [-UpdateIfExists]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDUPDATEEXTERNALUSERENTITY"

## EXAMPLES

### EXAMPLE 1
```
Add-PVExternalUser -destUser admin01 -ldapDirectory PSPETE.DEV -UpdateIfExists
```

Updates user admin01 in vault from domain PSPETE.DEV

## PARAMETERS

### -destUser
The name (samaccountname) of the external User or Group that will be created
in the Vault.

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

### -ldapFullDN
The full DN of the user in the external directory.

```yaml
Type: String
Parameter Sets: (All)
Aliases: DN, distinguishedName

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ldapDirectory
The name of the external directory where the user or group is defined.

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

### -UpdateIfExists
Whether or not existing external Users and Groups definitions will be updated
in the Vault.

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

Work required to support LDAPFullDN & Parameter Validation / Parameter Sets

## RELATED LINKS
