---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Add-PVTrustedNetworkArea
---

# Add-PVTrustedNetworkArea

## SYNOPSIS
Adds a Trusted Network Area from which a CyberArk User can access the
CyberArk Vault.

## SYNTAX

```
Add-PVTrustedNetworkArea [-trusterName] <String> [-networkArea] <String> [[-fromHour] <Int32>]
 [[-toHour] <Int32>] [[-maxViolationCount] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "ADDTRUSTEDNETWORKAREA"

## EXAMPLES

### EXAMPLE 1
```
Add-PVTrustedNetworkArea -trusterName user1 -networkArea "All\VPN"
```

Adds VPN Trusted Network Area to user1

## PARAMETERS

### -trusterName
The User who will have access to the Trusted Network Area.

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

### -networkArea
The name of the Trusted Network Area to add.

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

### -fromHour
The time from which access to the Vault is permitted.

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

### -toHour
The time until which access to the Vault is permitted.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -maxViolationCount
The maximum number of access violations permitted before the User is not
permitted to access the Vault.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
AUTHOR: Pete Maan

## RELATED LINKS
