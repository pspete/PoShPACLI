Function New-PVLDAPBranch {

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
		New-PVLDAPBranch -vault Lab -user administrator -ldapMapName "Vault Users Mapping" -ldapDirName Domain.COM `
		-ldapBranchName "DC=Domain,DC=Com" -ldapQuery "samaccountname=this_user"

		Adds LDAP Branch to Vault Users Mapping with specified LDAP Query

	.NOTES
		AUTHOR: Pete Maan
		LASTEDIT: August 2017
	#>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$ldapMapName,
		[Parameter(Mandatory = $True)][string]$ldapDirName,
		[Parameter(Mandatory = $True)][string]$ldapBranchName,
		[Parameter(Mandatory = $False)][string]$ldapQuery,
		[Parameter(Mandatory = $False)][string]$ldapGroupMatch,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli with parameters
		$Return = Invoke-PACLICommand $pacli LDAPBRANCHADD "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

						#assign values to properties
						"LDAPBranchID"   = $values[0]
						"LDAPMapID"      = $values[1]
						"LDAPMapName"    = $values[2]
						"LDAPDirName"    = $values[3]
						"LDAPBranchName" = $values[4]
						"LDAPQuery"      = $values[5]
						"LDAPGroupMatch" = $values[6]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI -PropertyToAdd @{
						"vault"     = $vault
						"user"      = $user
						"sessionID" = $sessionID
					}

				}

			}

		}

	}

}