Function Set-PVLDAPBranch {

	<#
	.SYNOPSIS
	Updates an existing LDAP branch in a CyberArk Directory Map

	.DESCRIPTION
	Exposes the PACLI Function: "LDAPBRANCHUPDATE"

	.PARAMETER ldapMapName
	The name of the Directory Map where the LDAP branch will be updated.

	.PARAMETER updateBranchID
	A 64-bit unique ID of the branch to update

	.PARAMETER ldapDirName
	The name of the LDAP directory.

	.PARAMETER ldapBranchName
	The DN of the LDAP directory branch.

	.PARAMETER ldapQuery
	The LDAP filter that is applied to objects in the specified branch.

	.PARAMETER ldapGroupMatch
	A regular expression used to filter LDAP groups of objects in the branch.

	.EXAMPLE
	Set-PVLDAPBranch -ldapMapName "Vault Users Mapping" -updateBranchID 3 -ldapGroupMatch new_group -ldapDirName COMPANY.COM -ldapBranchName "DC=COMPANY,DC=COM"

	Sets LDAP Group Match on branch with ID of 3 in "Vault Users Mapping"

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapMapName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("LDAPBranchID")]
		[string]$updateBranchID,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapDirName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapBranchName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapQuery,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapGroupMatch
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath LDAPBRANCHUPDATE "$($PSBoundParameters | ConvertTo-ParameterString -donotQuote updateBranchID) OUTPUT (ALL,ENCLOSE)"

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