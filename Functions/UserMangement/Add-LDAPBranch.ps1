Function Add-LDAPBranch {

	<#
    .SYNOPSIS
    	Adds an LDAP branch to an existing CyberArk Directory Map

    .DESCRIPTION
    	Exposes the PACLI Function: "LDAPBRANCHADD"

    .PARAMETER vault
		The name of the Vault.

    .PARAMETER user
		The Username of the User who is logged on.

    .PARAMETER ldapMapName
		The name of the Directory Map where the LDAP branch will be added.

    .PARAMETER ldapDirName
		The name of the LDAP directory.

    .PARAMETER ldapBranchName
		The DN of the LDAP directory branch.

    .PARAMETER ldapQuery
		The LDAP filter that is applied to objects in the specified branch.

    .PARAMETER ldapGroupMatch
		A regular expression used to filter LDAP groups of objects in the branch.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$ldapMapName,
		[Parameter(Mandatory = $True)][string]$ldapDirName,
		[Parameter(Mandatory = $True)][string]$ldapBranchName,
		[Parameter(Mandatory = $False)][string]$ldapQuery,
		[Parameter(Mandatory = $False)][string]$ldapGroupMatch,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli with parameters
		$Return = Invoke-PACLICommand $pacli LDAPBRANCHADD "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

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

						#assign values to properties
						"LDAPBranchID"   = $values[0]
						"LDAPMapID"      = $values[1]
						"LDAPMapName"    = $values[2]
						"LDAPDirName"    = $values[3]
						"LDAPBranchName" = $values[4]
						"LDAPQuery"      = $values[5]
						"LDAPGroupMatch" = $values[6]

					}

				}

			}

		}

	}

}