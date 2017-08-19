Function Get-PVRule {

	<#
    .SYNOPSIS
    	Lists all the service rules in a specified Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "RULESLIST"

    .PARAMETER vault
        The name of the Vault.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER safeName
        The Safe where the ruls are applied.

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
		Get-PVRule -vault lab -user administrator -safeName UNIX -fullObjectname root\rootpass -isFolder $false

		Lists OLAC rules for rootpass

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safeName,
		[Parameter(Mandatory = $True)][string]$fullObjectname,
		[Parameter(Mandatory = $False)][switch]$isFolder,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli RULESLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 7) {

					#Get Range from array
					$values = $Results[$i..($i + 7)]

					#Output Object
					[PSCustomObject] @{

						"RuleID"           = $values[0]
						"UserName"         = $values[1]
						"SafeName"         = $values[2]
						"FullObjectName"   = $values[3]
						"Effect"           = $values[4]
						"RuleCreationDate" = $values[5]
						"AccessLevel"      = $values[6]

					}

				}

			}

		}

	}

}