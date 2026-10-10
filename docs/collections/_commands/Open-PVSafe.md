---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Open-PVSafe
---

# Open-PVSafe

## SYNOPSIS
Open a Safe (Safe Owner authorizations required).
When the Safe is opened,
various details about the Safe will be displayed, depending on the
parameters specified.

## SYNTAX

```
Open-PVSafe [-safe] <String> [[-requestUsageType] <String>] [[-requestAccessType] <String>]
 [[-usableFrom] <String>] [[-usableTo] <String>] [[-requestReason] <String>] [-useRequest] [-sendRequest]
 [-executeRequest] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "OPENSAFE"

## EXAMPLES

### EXAMPLE 1
```
Open-PVSafe -safe System
```

Opens the System safe

## PARAMETERS

### -safe
The name of the Safe to open.

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

### -requestUsageType
The operation that the user will carry out.

Possible options are:
	REQUEST_AND_USE - create and send a request if
	necessary, or use the confirmation if it has been granted to
	open the Safe/file/password.

	CHECK_DONT_USE - check if a request has been sent or,
	if not, create one and send an error.
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
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -requestAccessType
Whether the request is for a single or multiple access.
Possible options are:
	SINGLE - for a single access.

	MULTIPLE - for multiple accesses.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
Position: 4
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
Position: 5
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
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -useRequest
If a confirmed request exists, it will be used.

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

### -sendRequest
A request will be sent, if needed.

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
The action will be executed, if a confirmation exists or is not
needed.

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
