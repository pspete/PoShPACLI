﻿Function Get-File {

	<#
    .SYNOPSIS
    	Retrieves a file from a Safe, if the appropriate authorizations are held.

    .DESCRIPTION
    	Exposes the PACLI Function: "RETRIEVEFILE"

    .PARAMETER vault
        The name of the Vault to which the User has access.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe containing the file to retrieve.

    .PARAMETER folder
        The folder in which the file is located.

    .PARAMETER file
        The name of the file to retrieve.

    .PARAMETER localFolder
        The location on the User’s terminal into which the file will be
        retrieved.

    .PARAMETER localFile
        The name under which the file will be saved on the User’s
        terminal.

    .PARAMETER lockFile
        Whether or not the file will be locked after it has been
        retrieved.

    .PARAMETER evenIfLocked
        Whether or not the file will be retrieved if the file is locked by
        another user.

    .PARAMETER requestUsageType
        The operation that the user will carry out.
        Possible options are:
            REQUEST_AND_USE – create and send a request if
                necessary, or use the confirmation if it has been granted
                to open the Safe/file/password.
            CHECK_DON’T_USE – check if a request has been sent
                or, if not, create one and send an error. If a request is
                not needed, carry out the action.
            USE_ONLY – if the request has been confirmed, or if a
                request is not needed, open the Safe/file/password.

        Note: In version 4.1, this parameter has no default value and
        is obsolete. However, it can still be used as long as the
        ‘userequest’, ‘sendrequest’ and ‘executerequest’ parameters
        are not specified.

    .PARAMETER requestAccessType
        Whether the request is for a single or multiple access.
        Possible options are:
            SINGLE – for a single access.
            MULTIPLE – for multiple accesses.

    .PARAMETER usableFrom
        The proposed date from when the request will be valid.

    .PARAMETER usableTo
        The proposed date until when the request will be valid.

    .PARAMETER requestReason
        The reason for the request.

    .PARAMETER userRequest
        If a confirmed request exists, it will be used to open the Safe
        and retrieve the specified file.

    .PARAMETER sendRequest
        If a request is required to retrieve the selected file, it will be
        sent.

    .PARAMETER executeRequest
        If a confirmed request exists or a request is not needed, the
        specified file will be retrieved.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
        Get-File -vault lab -user administrator -safe AWS -folder root -file AccessKey -localFolder d:\AWS -localFile key

        Retrieves file and saves to local folder.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017

            Comment:
            If the userequest, sendrequest, and executerequest parameters are all
            set to ‘no’, and a request is needed, the status of the request will
            be returned as an error.
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$folder,
		[Parameter(Mandatory = $True)][string]$file,
		[Parameter(Mandatory = $True)][string]$localFolder,
		[Parameter(Mandatory = $True)][string]$localFile,
		[Parameter(Mandatory = $False)][switch]$lockFile,
		[Parameter(Mandatory = $False)][switch]$evenIfLocked,
		[Parameter(Mandatory = $False)][ValidateSet("REQUEST_AND_USE", "CHECK_DON’T_USE", "USE_ONLY")][string]$requestUsageType,
		[Parameter(Mandatory = $False)][ValidateSet("SINGLE", "MULTIPLE")][string]$requestAccessType,
		[Parameter(Mandatory = $False)][string]$usableFrom,
		[Parameter(Mandatory = $False)][string]$usableTo,
		[Parameter(Mandatory = $False)][string]$requestReason,
		[Parameter(Mandatory = $False)][switch]$userRequest,
		[Parameter(Mandatory = $False)][switch]$sendRequest,
		[Parameter(Mandatory = $False)][switch]$executeRequest,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli RETRIEVEFILE $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote requestUsageType, requestAccessType)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}