Function Send-PAMailMessage {

	<#
	.SYNOPSIS
		Enables a User to send e-mail using details in the User’s account

	.DESCRIPTION
		Exposes the PACLI Function: "MAILUSER"

	.PARAMETER vault
	The name of the Vault to which the User has access.

	.PARAMETER user
	The Username of the User who is carrying out the command

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

	.PARAMETER sessionID
		The ID number of the session. Use this parameter when working
		with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE

		Send-PAMailMessage -vault Lab -user Administrator -mailServerIP 10.10.10.50 -senderEmail epv@company.com `
		-domainName company.com -recipientEmail user@company.com -recipientUser CF0 -safe Audit_Reports -folder Reports `
		-file ActivityReport -subject SUBJECT -templateFile template.txt -parm1 "Auditors"

		Example for template file content:
		Dear %%RecipientUser,
		I have sent you a new report named %%FILE in safe %%SAFE folder
		%%FOLDER. Please take the time to review it.
		Best Regards,
		%%PARM1.

		Sends an email to the specified vault user in accordance with the supplied parameters.

	.NOTES
		AUTHOR: Pete Maan
		LASTEDIT: August 2017
	#>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$mailServerIP,
		[Parameter(Mandatory = $True)][string]$senderEmail,
		[Parameter(Mandatory = $True)][string]$domainName,
		[Parameter(Mandatory = $False)][string]$recipientEmail,
		[Parameter(Mandatory = $False)][string]$recipientUser,
		[Parameter(Mandatory = $False)][string]$safe,
		[Parameter(Mandatory = $False)][string]$folder,
		[Parameter(Mandatory = $False)][string]$file,
		[Parameter(Mandatory = $False)][string]$subject,
		[Parameter(Mandatory = $False)][string]$text,
		[Parameter(Mandatory = $False)][switch]$useBusinessMail,
		[Parameter(Mandatory = $False)][switch]$useHomeMail,
		[Parameter(Mandatory = $False)][switch]$useOtherMail,
		[Parameter(Mandatory = $False)][string]$templateFile,
		[Parameter(Mandatory = $False)][string]$parm1,
		[Parameter(Mandatory = $False)][string]$parm2,
		[Parameter(Mandatory = $False)][string]$parm3,
		[Parameter(Mandatory = $False)][string]$parm4,
		[Parameter(Mandatory = $False)][string]$parm5,
		[Parameter(Mandatory = $False)][string]$parm6,
		[Parameter(Mandatory = $False)][string]$parm7,
		[Parameter(Mandatory = $False)][string]$parm8,
		[Parameter(Mandatory = $False)][string]$parm9,
		[Parameter(Mandatory = $False)][string]$parm10,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli MAILUSER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			exit 0

		}

	}

}