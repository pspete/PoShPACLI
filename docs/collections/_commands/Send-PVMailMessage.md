---
external help file: PoShPACLI-help.xml
Module Name: PoShPACLI
online version:
schema: 2.0.0
title: Send-PVMailMessage
---

# Send-PVMailMessage

## SYNOPSIS
Enables a User to send e-mail using details in the User's account

## SYNTAX

```
Send-PVMailMessage [-mailServerIP] <String> [-senderEmail] <String> [-domainName] <String>
 [[-recipientEmail] <String>] [[-recipientUser] <String>] [[-safe] <String>] [[-folder] <String>]
 [[-file] <String>] [[-subject] <String>] [[-text] <String>] [-useBusinessMail] [-useHomeMail] [-useOtherMail]
 [[-templateFile] <String>] [[-parm1] <String>] [[-parm2] <String>] [[-parm3] <String>] [[-parm4] <String>]
 [[-parm5] <String>] [[-parm6] <String>] [[-parm7] <String>] [[-parm8] <String>] [[-parm9] <String>]
 [[-parm10] <String>] [<CommonParameters>]
```

## DESCRIPTION
Exposes the PACLI Function: "MAILUSER"

## EXAMPLES

### EXAMPLE 1
```
Send-PVMailMessage -mailServerIP 10.10.10.50 -senderEmail epv@company.com `
-domainName company.com -recipientEmail user@company.com -recipientUser CF0 -safe Audit_Reports `
-folder Reports -file ActivityReport -subject SUBJECT -templateFile template.txt -parm1 "Auditors"
```

Example for template file content:
Dear %%RecipientUser,
I have sent you a new report named %%FILE in safe %%SAFE folder
%%FOLDER.
Please take the time to review it.
Best Regards,
%%PARM1.

Sends an email to the specified vault user in accordance with the supplied parameters.

## PARAMETERS

### -mailServerIP
The IP of the mail server

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

### -senderEmail
The E-mail address of the sender.
This is used as return address and in
the 'From' field of the mail.

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

### -domainName
The sender's domain (computer name).
This value can usually be anything
other than blank.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -recipientEmail
The E-mail address of the recipient

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

### -recipientUser
The recipient user in Vault=vault.
The recipient's E-mail is taken from
the user's personal details.
From the home address/business address/other
address according to the following parameters

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

### -safe
The outgoing E-mail will contain a link to this CyberArk Vault file.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Safename

Required: False
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -folder
The outgoing E-mail will contain a link to this CyberArk Vault file.

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

### -file
The outgoing E-mail will contain a link to this CyberArk Vault file.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Filename

Required: False
Position: 8
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -subject
The subject of the E-mail message

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

### -text
The text of the E-mail message

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -useBusinessMail
Use the recipient user's business Email address.

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

### -useHomeMail
Use the recipient user's Home Email address.

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

### -useOtherMail
Use the recipient user's other E-mail address.

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

### -templateFile
The file path of a template for the Email to be sent.
The template file
may contain variables from this command only

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

### -parm1
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm2
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm3
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm4
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm5
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm6
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm7
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm8
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm9
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -parm10
Values for variables in the template file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
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
