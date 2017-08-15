﻿Function Remove-Rule {

	<#
    .SYNOPSIS
    	Deletes a service rule

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETERULE"

    .PARAMETER vault
        The name of the Vault.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER ruleID
        The unique ID of the rule to delete.

    .PARAMETER userName
        The user who will be affected by the rule.

    .PARAMETER safeName
        The Safe where the rule is applied.

    .PARAMETER fullObjectName
        The file, password, or folder that the rule applies to.

    .PARAMETER isFolder
        Whether the rule applies to files and passwords or for folders.
            NO – Indicates files and passwords
            YES – Indicates folders

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Remove-Rule -vault Lab -user administrator -ruleID 15 -userName kenny -safeName IDM -fullObjectName root\IDMPass -isFolder:$false

		Deletes OLAC rule 15 from object

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$ruleID,
		[Parameter(Mandatory = $True)][string]$userName,
		[Parameter(Mandatory = $True)][string]$safeName,
		[Parameter(Mandatory = $True)][string]$fullObjectName,
		[Parameter(Mandatory = $False)][switch]$isFolder,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETERULE $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote ruleID)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}