﻿Function Get-PasswordObject {

	<#
    .SYNOPSIS
    	Retrieves a password object from the Vault

    .DESCRIPTION
    	Exposes the PACLI Function: "RETRIEVEPASSWORDOBJECT"

    .PARAMETER vault
        The name of the Vault that contains the password object(s)
        you are looking for.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe that contains the password object(s)
        you are looking for. You can use a wildcard to specify a wider
        range of safenames.

    .PARAMETER folder
        The name of the folder that contains the password object(s) to
        be found.

    .PARAMETER file
        The name of the password object.

    .PARAMETER lockFile
        Whether or not to lock the password object.

    .PARAMETER evenIfLocked
        Whether or not the file will be retrieved if the password object
        is locked by another user.

    .PARAMETER requestUsageType
        The operation that the user will carry out.
        Possible options are:
            REQUEST_AND_USE – create and send a request if
                necessary, or use the confirmation if it has been granted
                to open the Safe/file/password.

            CHECK_DON’T_USE – check if a request has been sent
                or, if not, create one and send an error. If a request is not
                needed, carry out the action.

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
            MULTIPLE – for multiple accesses

    .PARAMETER usableFrom
        The proposed date from when the request will be valid.

    .PARAMETER usableTo
        The proposed date until when the request will be valid.

    .PARAMETER requestReason
        The reason for the request.

    .PARAMETER userRequest
        If a confirmed request exists, it will be used to open the Safe
        and retrieve the specified password object.

    .PARAMETER sendRequest
        If a request is required to retrieve the selected password
        object, it will be sent.

    .PARAMETER executeRequest
        If a confirmed request exists or a request is not needed, the
        specified password object will be retrieved.

    .PARAMETER internalName
        The name of a previous password version.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Get-PasswordObject -vault Lab -user administrator -safe Oracle -folder root -file Application-ORACLE-10.10.10.10-SYS -lockFile

        Retrieves the specified password from the Oracle safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$folder,
		[Parameter(Mandatory = $True)][string]$file,
		[Parameter(Mandatory = $True)][switch]$lockFile,
		[Parameter(Mandatory = $False)][switch]$evenIfLocked,
		[Parameter(Mandatory = $False)][ValidateSet("REQUEST_AND_USE", "CHECK_DON’T_USE", "USE_ONLY")][string]$requestUsageType,
		[Parameter(Mandatory = $False)][ValidateSet("SINGLE", "MULTIPLE")][string]$requestAccessType,
		[Parameter(Mandatory = $False)][string]$usableFrom,
		[Parameter(Mandatory = $False)][string]$usableTo,
		[Parameter(Mandatory = $False)][string]$requestReason,
		[Parameter(Mandatory = $False)][switch]$userRequest,
		[Parameter(Mandatory = $False)][switch]$sendRequest,
		[Parameter(Mandatory = $False)][switch]$executeRequest,
		[Parameter(Mandatory = $False)][string]$internalName,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli RETRIEVEPASSWORDOBJECT "$($PSBoundParameters.getEnumerator() |
            ConvertTo-ParameterString -donotQuote requestUsageType,requestAccessType) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#Output Object
				[PSCustomObject] @{

					"Password" = $Results

				}

			}

		}

	}

}