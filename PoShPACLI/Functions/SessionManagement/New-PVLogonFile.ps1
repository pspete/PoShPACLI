Function New-PVLogonFile {

	<#
	.SYNOPSIS
	This command creates a logon file that contains the information required
	for a User to log onto the Vault. After this file has been created, it
	can be used with the Connect-PVVault command.

	.DESCRIPTION
	Exposes the PACLI Function: "CREATELOGONFILE"

	.PARAMETER logonFile
	The full pathname of the file that contains all the User information to
	enable logon to the Vault

	.PARAMETER username
	The username of the user carrying out the task on the external token

	.PARAMETER password
	The password to save in the logon file that will allow logon to the Vault.

	.PARAMETER sessionID
	The ID number of the session. Use this parameter when working
	with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
	New-PVLogonFile -logonFile D:\PACLI\cred.file -username administrator -password $password

	Creates a new credential file, cred.file, which can be used for logon via Connect-PVVault.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$logonFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$username,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		#deal with password SecureString
		if ($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		$Return = Invoke-PACLICommand $Script:PV.ClientPath CREATELOGONFILE $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			

		}

	}

}