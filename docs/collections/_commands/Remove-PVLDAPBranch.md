---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Remove-PVLDAPBranch
---

# Remove-PVLDAPBranch

## SYNOPSIS
Deletes an LDAP branch from a CyberArk Directory Map

## SYNTAX

```
Remove-PVLDAPBranch [-ldapMapName] <String> [-deleteBranchID] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "LDAPBRANCHDELETE"

## EXAMPLES

### EXAMPLE 1
```
Remove-PVLDAPBranch -ldapMapName EU_Users -deleteBranchID 4
```

Deletes Ldap Branch with ID of 4 from EU_Users Mapping

## PARAMETERS

### -ldapMapName
The name of the Directory Map where the LDAP branch will be updated.

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

### -deleteBranchID
A 64-bit unique ID of the branch to update

```yaml
Type: String
Parameter Sets: (All)
Aliases: LDAPBranchID

Required: True
Position: 2
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
