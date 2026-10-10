---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: New-PVPassword
---

# New-PVPassword

## SYNOPSIS
Generates a password automatically according to the built-in password
policy, and the user-specified policy.

## SYNTAX

```
New-PVPassword [-length] <Int32> [[-minUpperCase] <Int32>] [[-minSpecial] <Int32>] [[-minLowerCase] <Int32>]
 [[-minDigit] <Int32>] [[-effectiveLength] <Int32>] [[-forbiddenChars] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "GENERATEPASSWORD"
The built-in policy ensures the following:
Numbers will not occur in the password edges
Repeated characters or sequences are not allowed
The user-specified policy enables the user to control the parameters
that are specified in this command

## EXAMPLES

### EXAMPLE 1
```
New-PVPassword -length 19 -minUpperCase 8 -minSpecial 3 -minLowerCase 6 `
-minDigit 1 -forbiddenChars xyz
```

Generates a new password as per the parameters

## PARAMETERS

### -length
The length of the password.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -minUpperCase
The minimum number of uppercase characters to be included
in the password.
Specify '-1' to exclude uppercase characters
from the password.

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

### -minSpecial
The minimum number of special characters to be included in
the password.
Specify '-1' to exclude special characters from
the password.

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

### -minLowerCase
The minimum number of lowercase characters to be included
in the password.
Specify '-1' to exclude lowercase characters
from the password.

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

### -minDigit
The minimum number of numeric characters to be included in
the password.
Specify '-1' to exclude digits from the
password.

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

### -effectiveLength
The number of characters from the beginning of the password
that the above 4 parameters apply to.

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

### -forbiddenChars
A list of characters that will not be included in the password.
These characters do not have separators, but must be inside
quotation marks, eg., "/?\"

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
