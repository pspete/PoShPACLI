---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Get-PVCTLCertificate
---

# Get-PVCTLCertificate

## SYNOPSIS
Lists all the certificates in the Certificate Trust List store.

## SYNTAX

```
Get-PVCTLCertificate [[-ctlFileName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "CTLLIST"

## EXAMPLES

### EXAMPLE 1
```
Get-PVCTLCertificate
```

lists all the certificates in the Certificate Trust List store/file
using the CTL file provided as parameter value to Start-PVPacli function.

## PARAMETERS

### -ctlFileName
The name of the CTL file that contains the certificates to list.
If this
parameter is not supplied, the CTL file name that was supplied in
the INIT function is used.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
