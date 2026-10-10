---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Start-PVPacli
---

# Start-PVPacli

## SYNOPSIS
Starts the PACLI executable.
This command must be run before any other
commands.

## SYNTAX

```
Start-PVPacli [[-sessionID] <Int32>] [[-ctlFileName] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "INIT"

## EXAMPLES

### EXAMPLE 1
```
Start-PVPacli -sessionID $PID
```

Starts the PACLI process with a session ID equal to the process ID of the current
Powershell process.

## PARAMETERS

### -sessionID
The ID number of the session.
Use this parameter when working
with multiple scripts simultaneously.
The default is '0'.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ctlFileName
The full path of the file that contains the Certificate Trust List (CTL).

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
