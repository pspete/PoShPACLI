---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVLDAPBranch
---

# Get-PVLDAPBranch

## SYNOPSIS
Lists the LDAP branches in a specified CyberArk Directory Map

## SYNTAX

```
Get-PVLDAPBranch [-ldapMapName] <String> [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "LDAPBRANCHESLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVLDAPBranch -ldapMapName "Vault Users Mapping"
```

Lists LDAP branches for Vault Users Mapping

## PARAMETERS

### -ldapMapName
The name of the Directory Map which contains the branches that will be listed.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
