---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVRequest
---

# Get-PVRequest

## SYNOPSIS
Lists requests from users who wish to enter Safes that require manual
access confirmation from authorized users.

## SYNTAX

```
Get-PVRequest [[-requestsType] <String>] [[-requestorPattern] <String>] [[-safePattern] <String>]
 [[-objectPattern] <String>] [-waiting] [-confirmed] [[-displayInvalid] <String>] [-includeAlreadyHandled]
 [[-requestID] <String>] [[-objectsType] <String>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "REQUESTSLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVRequest -requestsType INCOMING_REQUESTS
```

Lists all Incoming Requests for the authenticated user

## PARAMETERS

### -requestsType
The type of requests to display.
The options are:
	MY_REQUESTS - your user requests for access.
	INCOMING_REQUESTS - other users' requests for you
		to authorize.
	ALL_REQUESTS - other users' requests as well as
		your own user requests (in the  CyberArk Vault
		version 3.5 and above).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -requestorPattern
Pattern of the username of the user who created the request.

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

### -safePattern
Pattern of the Safe specified in the request.

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

### -objectPattern
Pattern of the file or password specified in the request.
Note: This parameter specifies the full object name, including
the folder.
Either specify the full name of a specific object, or
use an asterisk (*) before the object name.

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

### -waiting
Whether or not the request is waiting for a response.

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

### -confirmed
Whether or not the request is waiting for a confirmation.

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

### -displayInvalid
Whether to display all requests or only invalid ones.
The options are:
	ALL_REQUESTS
	ONLY_VALID
	ONLY_INVALID

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

### -includeAlreadyHandled
Whether to include requests that have already been handled
in the list of requests.

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

### -requestID
The unique ID number of the request.

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

### -objectsType
The type of operation that generated this request.
Possible values:
	ALL_OBJECTS
	GET_FILE
	GET_PASSWORD
	OPEN_SAFE

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
