---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Set-PVLDAPBranch
---

# Set-PVLDAPBranch

## SYNOPSIS
Updates an existing LDAP branch in a CyberArk Directory Map

## SYNTAX

```
Set-PVLDAPBranch [-ldapMapName] <String> [-updateBranchID] <String> [-ldapDirName] <String>
 [-ldapBranchName] <String> [[-ldapQuery] <String>] [[-ldapGroupMatch] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "LDAPBRANCHUPDATE"

## EXAMPLES

### EXAMPLE 1
```
Set-PVLDAPBranch -ldapMapName "Vault Users Mapping" -updateBranchID 3 -ldapGroupMatch new_group -ldapDirName COMPANY.COM -ldapBranchName "DC=COMPANY,DC=COM"
```

Sets LDAP Group Match on branch with ID of 3 in "Vault Users Mapping"

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

### -updateBranchID
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

### -ldapDirName
The name of the LDAP directory.

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

### -ldapBranchName
The DN of the LDAP directory branch.

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

### -ldapQuery
The LDAP filter that is applied to objects in the specified branch.

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

### -ldapGroupMatch
A regular expression used to filter LDAP groups of objects in the branch.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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
