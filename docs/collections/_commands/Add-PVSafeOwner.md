---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVSafeOwner
---

# Add-PVSafeOwner

## SYNOPSIS
Enables Safe Owner authorizations to be given to a User in a
specified Safe.
In order to carry out this command successfully, the Safe must be open.

## SYNTAX

```
Add-PVSafeOwner [-owner] <String> [-safe] <String> [-readOnlyByDefault] [-retrieve] [-store] [-delete]
 [-administer] [-supervise] [-backup] [-manageOwners] [-accessNoConfirmation] [-validateSafeContent] [-list]
 [-usePassword] [-updateObjectProperties] [-initiateCPMChange] [-initiateCPMChangeWithManualPassword]
 [-createFolder] [-deleteFolder] [-moveFrom] [-moveInto] [-viewAudit] [-viewPermissions] [-eventsList]
 [-addEvents] [-createObject] [-unlockObject] [-renameObject] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDOWNER"

## EXAMPLES

### EXAMPLE 1
```
Add-PVSafeOwner -owner The_User -safe The_Safe -retrieve -store `
-administer -supervise
```

Adds user The_User to safe The_Safe with the specified safe permissions.

## PARAMETERS

### -owner
The name of the Safe Owner to add to the Safe.

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

### -safe
The name of the Safe to which to add the Safe Owner.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Safename

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -readOnlyByDefault
Whether or not the user's initial access to the files in the Safe is for
read-only format.

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

### -retrieve
Whether or not the Safe Owner will be able to retrieve files.

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
Whether or not the Safe Owner will be able to store files.

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
Whether or not the Safe Owner will be able to delete files.

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
Whether or not the Safe Owner will be able to administer the Safe.

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
Whether or not the Safe Owner will be able to supervise other Safe Owners
and confirm requests by other users to enter specific Safes.

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
Whether or not the Safe Owner will be able to backup the Safe.

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
Whether or not the Safe Owner will be able to manage other Safe Owners.

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
Whether or not the Safe Owner will be able to access the Safe without
requiring confirmation from authorized users.

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
Whether or not the Safe Owner will be able to change the validation status
of the Safe contents.

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
Whether or not the Safe Owner will be able to list Safe contents

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
Whether or not the Safe Owner will be able to use the password in the PVWA.

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
Whether or not the Safe Owner will be able to update object properties.

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
Whether or not the Safe Owner will be able to initiate CPM changes for
passwords.

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
Whether or not the Safe Owner will be able to initiate a CPM change with
a manual password.

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
Whether or not the Safe Owner will be able to create folders.

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
Whether or not the Safe Owner will be able to delete folders.

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
Whether or not the Safe Owner will be able to move objects from their
existing locations.

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
Whether or not the Safe Owner will be able to move objects into new
locations.

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
Whether or not the Safe Owner will be able to view other users' audits.

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
Whether or not the Safe Owner will be able to view permissions of other
users.

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
Whether or not the Safe Owner will be able to list events.
Note: To allow Safe Owners to access the Safe, make sure this is set to YES.

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
Whether or not the Safe Owner will be able to add events.

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
Whether or not the Safe Owner will be able to create new objects.

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
Whether or not the Safe Owner will be able to unlock objects.

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
Whether or not the Safe Owner will be able to rename objects.

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
