---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: New-PVVaultDefinition
---

# New-PVVaultDefinition

## SYNOPSIS
Enables a Vault to be defined

## SYNTAX

```
New-PVVaultDefinition [-vault] <String> [-address] <String> [[-port] <Int32>] [[-timeout] <Int32>]
 [-behindFirewall] [[-reconnectPeriod] <Int32>] [-useOnlyHTTP1] [[-proxyType] <String>]
 [[-proxyAddress] <String>] [[-proxyPort] <Int32>] [[-proxyUser] <String>] [[-proxyPassword] <SecureString>]
 [[-proxyAuthDomain] <String>] [[-numOfRecordsPerSend] <Int32>] [[-numOfRecordsPerChunk] <Int32>]
 [-enhancedSSL] [-preAuthSecuredSession] [-trustSSC] [-allowSSCFor3PartyAuth] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "DEFINE"

## EXAMPLES

### EXAMPLE 1
```
New-PVVaultDefinition -vault VaultA -address 10.10.10.20
```

Defines a connection to Vault (VaultA) with IP 10.10.10.20
VaultA definition is used in subsequent executions of PACLI functions.

## PARAMETERS

### -vault
The name of the Vault to create.

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

### -address
The IP address of the Vault.

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

### -port
The Vault IP port.

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

### -timeout
The number of seconds to wait for a Vault to respond to a
command before a timeout message is displayed.

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

### -behindFirewall
Whether or not the Vault will be accessed via a Firewall.

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

### -reconnectPeriod
The number of seconds to wait before the sessions with the
Vault is re-established.

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

### -useOnlyHTTP1
Use only HTTP 1.0 protocol.
This parameter is valid either
with proxy settings or with 'behindfirewall'.

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

### -proxyType
The type of proxy through which the Vault is accessed.
Valid
values for this parameter are: HTTP, HTTPS, SOCKS4, SOCKS5, NOPROXY

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

### -proxyAddress
The proxy server IP address.
This is mandatory when using
a proxy server.

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

### -proxyPort
The Proxy server IP Port

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

### -proxyUser
User for Proxy server if NTLM authentication is required

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

### -proxyPassword
User's Password for Proxy server

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -proxyAuthDomain
The authentication domain of the proxy

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -numOfRecordsPerSend
The number of file records to transfer together in a single
TCP/IP send/receive commands.

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

### -numOfRecordsPerChunk
The number of file records to transfer together in a single
TCP/IP send/receive operation.

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

### -enhancedSSL
Whether or not an Enhanced SSL-based connection (port
443) is required.

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

### -preAuthSecuredSession
Whether or not pre-authentication secured session is enabled.

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

### -trustSSC
Whether or not self-signed certificates are trusted for preauthentication
secured sessions.
Note: This parameter can only be enabled if 'preauthsecuredsession' is specified.

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

### -allowSSCFor3PartyAuth
Whether or not to allow 3rd party authentication with selfsigned certificates.
Note: This parameter can only be enabled if 'trustssc' is specified.

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
