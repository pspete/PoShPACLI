---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVRule
---

# Add-PVRule

## SYNOPSIS
Adds an Object Level Access rule

## SYNTAX

```
Add-PVRule [-userName] <String> [-safeName] <String> [-fullObjectName] <String> [-isFolder] [-effect] <String>
 [-retrieve] [-store] [-delete] [-administer] [-supervise] [-backup] [-manageOwners] [-accessNoConfirmation]
 [-validateSafeContent] [-list] [-usePassword] [-updateObjectProperties] [-initiateCPMChange]
 [-initiateCPMChangeWithManualPassword] [-createFolder] [-deleteFolder] [-moveFrom] [-moveInto] [-viewAudit]
 [-viewPermissions] [-eventsList] [-addEvents] [-createObject] [-unlockObject] [-renameObject]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDRULE"

## EXAMPLES

### EXAMPLE 1
```
Add-PVRule -userName user1 -safeName DEV-1 `
-fullObjectName root\rootpass -effect Allow -retrieve -store -delete
```

Adds rule on object rootpass safe DEV-1 fr user user1

## PARAMETERS

### -userName
The user who will be affected by the rule.

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

### -safeName
The Safe where the rule is applied.

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

### -fullObjectName
The file, password, or folder that the rule applies to.

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

### -isFolder
Whether the rule applies to files and passwords or for
folders.
	NO - Indicates files and passwords
	YES - Indicates folders

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

### -effect
Whether or not the rule allows or denies the user
authorizations that are specified in the following parameters.
Possible values are:
	Allow - The rule enables the authorizations marked 'YES'.
	Deny - The rule denies all the following permissions.

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

### -retrieve
Whether or not the user is authorized to retrieve files.

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

### -store
Whether or not the user is authorized to store files.

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

### -delete
Whether or not the user is authorized to delete files.

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

### -administer
Whether or not the user is authorized to administer the Safe.

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

### -supervise
Whether or not the user is authorized to supervise other Safe
Owners and confirm requests by other users to enter specific
Safes

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

### -backup
Whether or not the user is authorized to backup the Safe

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

### -manageOwners
Whether or not the user is authorized to manage other Safe
owners.

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

### -accessNoConfirmation
Whether or not the user is authorized to access the Safe
without receiving confirmation from authorized users.

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

### -validateSafeContent
Whether or not the user is authorized to validate the Safe
contents.

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

### -list
Whether or not the user is authorized to list the specified file,
password, or folder.

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

### -usePassword
If the object is a password, whether or not the user can use
the password via the PVWA.

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

### -updateObjectProperties
Whether or not the user is authorized to update the specified
file or password categories.

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

### -initiateCPMChange
Whether or not the user is authorized to initiate a CPM
change for the specified password.

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

### -initiateCPMChangeWithManualPassword
Whether or not the user is authorized to initiate a CPM
change with a manual password for the specified password.

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

### -createFolder
Whether or not the user is authorized to create a new folder.

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

### -deleteFolder
Whether or not the user is authorized to delete a folder.

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

### -moveFrom
Whether or not the user is authorized to move the specified
file or password from its current location.

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

### -moveInto
Whether or not the user is authorized to move the specified
file or password into a different location.

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

### -viewAudit
Whether or not the user is authorized to view the specified
file or password audits.

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

### -viewPermissions
Whether or not the user is authorized to view the specified
file or password permissions.

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

### -eventsList
Whether or not the user is authorized to view events.

Note: To allow Safe Owners to access the Safe, make sure
this is set to YES.

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

### -addEvents
Whether or not the user is authorized to add events.

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

### -createObject
Whether or not the user is authorized to create a new file or
password.

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

### -unlockObject
Whether or not the user is authorized to unlock the specified
file or password.

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

### -renameObject
Whether or not the user is authorized to rename the
specified file or password.

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
