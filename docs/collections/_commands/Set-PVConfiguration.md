---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Set-PVConfiguration
---

# Set-PVConfiguration

## SYNOPSIS
Sets a variable in the script scope which holds default values for PACLI operations.
Must be run prior to other module functions if path to PACLI has not been previously set.

## SYNTAX

```
Set-PVConfiguration [[-ClientPath] <String>] [[-sessionID] <Int32>] [[-vault] <String>] [[-user] <String>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets properties on an object which is set as the value of a variable in the script scope.
The created variable can be queried and used by other module functions to provide default values.
Creates a file in the logged on users home folder named PV_Configuration.xml.
This file contains the variable
used by the module, and will be imported with the module.

## EXAMPLES

### EXAMPLE 1
```
Set-PVConfiguration -ClientPath D:\Path\To\PACLI.exe
```

Sets default path to PACLI to D:\Path\To\PACLI.exe.
This is accessed via the variable property $Script:PV.ClientPath
Creates C:\users\user\PV_Configuration.xml file to hold values for persistence.

## PARAMETERS

### -ClientPath
The path to the PACLI.exe utility

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

### -sessionID
The sessionID value to use for PACLI Commands

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -vault
The value to use for the vault parameter in PACLI Commands

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

### -user
The value to use for the user parameter in PACLI commands

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

## RELATED LINKS
