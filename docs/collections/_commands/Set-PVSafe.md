---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Set-PVSafe
---

# Set-PVSafe

## SYNOPSIS
Updates Safe properties

## SYNTAX

```
Set-PVSafe [-safe] <String> [[-location] <String>] [[-size] <Int32>] [[-description] <String>]
 [[-fromHour] <Int32>] [[-toHour] <Int32>] [[-delay] <Int32>] [[-dailyVersions] <Int32>]
 [[-monthlyVersions] <Int32>] [[-yearlyVersions] <Int32>] [[-logRetention] <Int32>] [[-fileRetention] <Int32>]
 [[-requestsRetention] <Int32>] [[-safeFilter] <String>] [[-safeOptions] <SafeOptions>]
 [[-securityLevelParm] <SecurityLevel>] [[-confirmationType] <Int32>] [[-confirmationCount] <Int32>]
 [-alwaysNeedConfirmation] [-getNewFileAccessMark] [-getRetrievedFileAccessMark] [-getModifiedFileAccessMark]
 [-readOnlyByDefault] [-useFileCategories] [-requireReason] [-enforceExclusivePasswords]
 [-requireContentValidation] [[-maxFileSize] <Int32>] [[-allowedFileTypes] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "UPDATESAFE"

## EXAMPLES

### EXAMPLE 1
```
Set-PVSafe -safe DEV -size 100
```

Sets size of 100Mb on DEV safe

### EXAMPLE 2
```
Set-PVSafe -safe SomeSafe -securityLevelParm Internal, HighlySecured -safeOptions FullyImpersonatedUsers, ImpersonatedUsers, PartiallyImpersonatedUsers
```

Update safe "SomeSafe" with declared security flags & Safe sharing options.

## PARAMETERS

### -safe
The name of the Safe to update.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Safename

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -location
The location of the Safe in the Vault hierarchy.
Note: Add a backslash '\' before the name of the location.

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

### -size
The maximum size of the Safe in MB.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -description
A description of the Safe.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -fromHour
The time from which Users can access the Safe.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -toHour
The time until which Users can access the Safe.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -delay
The delay in seconds between when the User opens the Safe and the Vault
permits access

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -dailyVersions
The number of daily versions of files to be retained.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -monthlyVersions
The number of monthly versions of files to be retained.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -yearlyVersions
The number of yearly versions of files to be retained.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -logRetention
The number of days that must pass before log files can be completely
deleted from the Safe.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -fileRetention
The number of days that must pass before files (other than log files)
in the Safe can be completely deleted.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -requestsRetention
The number of days that must pass before requests can be completely deleted
from the Safe.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -safeFilter
Specifies the type of Safe content filter.
Possible values are:
None - the Safe will be a regular Safe and will not have any content filter.
TextOnlyFilter - the Safe will only store text files.

Note:
Text Only Safes can be changed into regular Safes, but a regular Safe cannot become
a filtered Safe.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -safeOptions
This parameter enables to Safe to be shared with any combination of the following values:
PartiallyImpersonatedUsers (Enable access to partially impersonated users)
FullyImpersonatedUsers (Enable access to fully impersonated users)
ImpersonatedUsers (Enable access to impersonated users with additional Vault authentication)
EnforceSafeOpening (Enforce Safe opening from PrivateArk Client)

```yaml
Type: SafeOptions
Parameter Sets: (All)
Aliases:
Accepted values: PartiallyImpersonatedUsers, FullyImpersonatedUsers, EnforceSafeOpening, ImpersonatedUsers

Required: False
Position: 15
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -securityLevelParm
Specify the Network Area security flags.
Valid values are combinations of the following:
Locations: Internal, External, Public.
Security Areas: HighlySecured, Secured, Unsecured

```yaml
Type: SecurityLevel
Parameter Sets: (All)
Aliases:
Accepted values: Internal, External, Public, HighlySecured, Secured, Unsecured

Required: False
Position: 16
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -confirmationType
The type of confirmation required to enable access to the Safe.
Possible values for this parameter are:
1 - No confirmation is needed (default)
2 - Confirmation is needed to open the Safe
3 - Confirmation is needed to retrieve files
4 - Confirmation is needed to open the Safe and retrieve files
and passwords

Note: When the value of this parameter is set to '0' (zero), the value of
'confirmationcount' will also be set to '0' (zero) automatically instead
of to the default value.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -confirmationCount
The number of authorized Safe Owners required to confirm the users request to access
the Safe.
0-64 - The number of authorized Owners that need to confirm (default=1)
255 - All authorized Owners need to confirm

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -alwaysNeedConfirmation
Whether or not all Owners require confirmation to access the Safe.

No - Confirmation is needed only if the request is from an Owner who is unauthorized
to confirm requests.
Yes - All Owners need confirmation, even Owners who are authorized to confirm
requests (default).

Note: This parameter can only be used when working with version 2.50 of the CyberArk
Vault.

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

### -getNewFileAccessMark
New files will be marked so they can be identified.

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

### -getRetrievedFileAccessMark
Retrieved files will be marked so they can be identified.

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

### -getModifiedFileAccessMark
Modified files will be marked so they can be identified.

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

### -readOnlyByDefault
New owners of this Safe will initially retrieve in readonly access mode.

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

### -useFileCategories
Whether or not to use Vault level file categories when storing a file in a Safe

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

### -requireReason
Whether or not a user is required to supply a reason before files and password
content can be retrieved from this Safe.

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

### -enforceExclusivePasswords
Whether or not the Safe will enforce exclusive passwords mode.

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

### -requireContentValidation
Whether or not files and passwords in this Safe must be validated before they
can be accessed

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

### -maxFileSize
The maximum size of files stored in the Safe in KB.
The default is '0' which indicates no maximum file size.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -allowedFileTypes
Indicates which file types are accepted in this Safe.

Possible file types are:
DOC, DOT, XLS, XLT, EPS, BMP, GIF, TGA, TIF, TIFF, LOG, TXT, PAL.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
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
