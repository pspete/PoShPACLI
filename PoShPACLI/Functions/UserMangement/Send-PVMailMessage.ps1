Function Send-PVMailMessage {

	<#
	.SYNOPSIS
	Enables a User to send e-mail using details in the User’s account

	.DESCRIPTION
	Exposes the PACLI Function: "MAILUSER"

	.PARAMETER mailServerIP
	The IP of the mail server

	.PARAMETER senderEmail
	The E-mail address of the sender. This is used as return address and in
	the ‘From’ field of the mail.

	.PARAMETER domainName
	The sender’s domain (computer name). This value can usually be anything
	other than blank.

	.PARAMETER recipientEmail
	The E-mail address of the recipient

	.PARAMETER recipientUser
	The recipient user in Vault=vault. The recipient’s E-mail is taken from
	the user’s personal details. From the home address/business address/other
	address according to the following parameters

	.PARAMETER safe
	The outgoing E-mail will contain a link to this CyberArk Vault file.

	.PARAMETER folder
	The outgoing E-mail will contain a link to this CyberArk Vault file.

	.PARAMETER file
	The outgoing E-mail will contain a link to this CyberArk Vault file.

	.PARAMETER subject
	The subject of the E-mail message

	.PARAMETER text
	The text of the E-mail message

	.PARAMETER useBusinessMail
	Use the recipient user’s business Email address.

	.PARAMETER useHomeMail
	Use the recipient user’s Home Email address.

	.PARAMETER useOtherMail
	Use the recipient user’s other E-mail address.

	.PARAMETER templateFile
	The file path of a template for the Email to be sent. The template file
	may contain variables from this command only

	.PARAMETER parm1
	Values for variables in the template file.

	.PARAMETER parm2
	Values for variables in the template file.

	.PARAMETER parm3
	Values for variables in the template file.

	.PARAMETER parm4
	Values for variables in the template file.

	.PARAMETER parm5
	Values for variables in the template file.

	.PARAMETER parm6
	Values for variables in the template file.

	.PARAMETER parm7
	Values for variables in the template file.

	.PARAMETER parm8
	Values for variables in the template file.

	.PARAMETER parm9
	Values for variables in the template file.

	.PARAMETER parm10
	Values for variables in the template file.

	.EXAMPLE

	Send-PVMailMessage -mailServerIP 10.10.10.50 -senderEmail epv@company.com `
	-domainName company.com -recipientEmail user@company.com -recipientUser CF0 -safe Audit_Reports `
	-folder Reports -file ActivityReport -subject SUBJECT -templateFile template.txt -parm1 "Auditors"

	Example for template file content:
	Dear %%RecipientUser,
	I have sent you a new report named %%FILE in safe %%SAFE folder
	%%FOLDER. Please take the time to review it.
	Best Regards,
	%%PARM1.

	Sends an email to the specified vault user in accordance with the supplied parameters.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$mailServerIP,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$senderEmail,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$domainName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$recipientEmail,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$recipientUser,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Filename")]
		[string]$file,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$subject,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$text,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$useBusinessMail,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$useHomeMail,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$useOtherMail,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$templateFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm1,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm2,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm3,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm4,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm5,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm6,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm7,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm8,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm9,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$parm10
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath MAILUSER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}