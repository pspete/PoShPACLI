Function New-LogonFile {

	<#
    .SYNOPSIS
    	This command creates a logon file that contains the information required
        for a User to log onto the Vault. After this file has been created, it
        can be used with the Connect-Vault command.

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
    	New-LogonFile -logonFile D:\PACLI\cred.file -username administrator -password $password

		Creates a new credential file, cred.file, which can be used for logon via Connect-Vault.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$logonFile,
		[Parameter(Mandatory = $False)][string]$username,
		[Parameter(Mandatory = $False)][securestring]$password,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#deal with password SecureString
		if($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		$Return = Invoke-PACLICommand $pacli CREATELOGONFILE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}