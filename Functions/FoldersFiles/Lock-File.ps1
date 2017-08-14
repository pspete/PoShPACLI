﻿Function Lock-File {

	<#
    .SYNOPSIS
    	Locks a file or password, preventing other Users from retrieving it.

    .DESCRIPTION
    	Exposes the PACLI Function: "LOCKFILE"

    .PARAMETER vault
        The name of the Vault in which the file is stored.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe in which the file is stored.

    .PARAMETER folder
        The name of the folder in which the file is stored.

    .PARAMETER file
        The name of the file or password to lock.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Lock-File -vault lab -user administrator -safe ORACLE -folder root -file SYSpass

		Locks file SYSpass in ORACLE safe.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$folder = "Root",
		[Parameter(Mandatory = $True)][string]$file,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli LOCKFILE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			Write-Verbose "Error Locking File: $file"
			$FALSE

		}

		else {

			Write-Verbose "$file Locked"
			$TRUE

		}

	}

}