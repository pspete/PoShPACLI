---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVPasswordObject
---

# Get-PVPasswordObject

## SYNOPSIS
Retrieves a password object from the Vault

## SYNTAX

```
Get-PVPasswordObject [-safe] <String> [-folder] <String> [-file] <String> [-lockFile] [-evenIfLocked]
 [[-requestUsageType] <String>] [[-requestAccessType] <String>] [[-usableFrom] <String>] [[-usableTo] <String>]
 [[-requestReason] <String>] [-useRequest] [-sendRequest] [-executeRequest] [[-internalName] <String>]
 [-AsSecureString] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "RETRIEVEPASSWORDOBJECT"

## EXAMPLES

### EXAMPLE 1
```
Get-PVPasswordObject -safe Oracle -folder root `
-file Application-ORACLE-10.10.10.10-SYS -lockFile
```

Retrieves the specified password from the Oracle safe

### EXAMPLE 2
```
Get-PVPasswordObject -safe Oracle -folder root -file Application-ORACLE-10.10.10.10-SYS -AsSecureString
```

Retrieves the specified password from the Oracle safe as a SecureString

## PARAMETERS

### -safe
The name of the Safe that contains the password object(s)
you are looking for.
You can use a wildcard to specify a wider
range of safenames.

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

### -folder
The name of the folder that contains the password object(s) to
be found.

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

### -file
The name of the password object.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Filename

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -lockFile
Whether or not to lock the password object.

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

### -evenIfLocked
Whether or not the file will be retrieved if the password object
is locked by another user.

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

### -requestUsageType
The operation that the user will carry out.
Possible options are:
REQUEST_AND_USE - create and send a request if
necessary, or use the confirmation if it has been granted
to open the Safe/file/password.

CHECK_DONT_USE - check if a request has been sent
or, if not, create one and send an error.
If a request is not
needed, carry out the action.

USE_ONLY - if the request has been confirmed, or if a
request is not needed, open the Safe/file/password.

Note: In version 4.1, this parameter has no default value and
is obsolete.
However, it can still be used as long as the
'userequest', 'sendrequest' and 'executerequest' parameters
are not specified.

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

### -requestAccessType
Whether the request is for a single or multiple access.
Possible options are:
SINGLE - for a single access.
MULTIPLE - for multiple accesses

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

### -usableFrom
The proposed date from when the request will be valid.

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

### -usableTo
The proposed date until when the request will be valid.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -requestReason
The reason for the request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -useRequest
If a confirmed request exists, it will be used to open the Safe
and retrieve the specified password object.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: userRequest

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -sendRequest
If a request is required to retrieve the selected password
object, it will be sent.

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

### -executeRequest
If a confirmed request exists or a request is not needed, the
specified password object will be retrieved.

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

### -internalName
The name of a previous password version.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AsSecureString
Output the retrieved password as a SecureString.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
