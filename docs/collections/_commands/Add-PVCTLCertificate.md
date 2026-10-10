---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVCTLCertificate
---

# Add-PVCTLCertificate

## SYNOPSIS
Adds a certificate to the Certificate Trust List store.

## SYNTAX

```
Add-PVCTLCertificate [[-ctlFileName] <String>] [[-certFileName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "CTLADDCERT"

## EXAMPLES

### EXAMPLE 1
```
Add-PVCTLCertificate -ctlFileName CTL.FILE -certFileName cert.File
```

Adds Certificate cert.File to Certificate Trust List store CTL.FILE

## PARAMETERS

### -ctlFileName
The name of the CTL file to the CTL store.
If this parameter is not
supplied, the CTL file name that was supplied in the INIT function
is used.

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

### -certFileName
The full path and name of the certificate file.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
