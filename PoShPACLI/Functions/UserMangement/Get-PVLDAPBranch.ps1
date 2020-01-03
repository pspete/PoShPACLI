Function Get-PVLDAPBranch {

	<#
	.SYNOPSIS
	Lists the LDAP branches in a specified CyberArk Directory Map

	.DESCRIPTION
	Exposes the PACLI Function: "LDAPBRANCHESLIST"

	.PARAMETER ldapMapName
	The name of the Directory Map which contains the branches that will be listed.

	.EXAMPLE
	Get-PVLDAPBranch -ldapMapName "Vault Users Mapping"

	Lists LDAP branches for Vault Users Mapping

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapMapName
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath LDAPBRANCHESLIST "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 7) {

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

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.LDAP.Branch

				}

			}

		}

	}

}