Function Remove-PVLDAPBranch {

	<#
	.SYNOPSIS
	Deletes an LDAP branch from a CyberArk Directory Map

	.DESCRIPTION
	Exposes the PACLI Function: "LDAPBRANCHDELETE"

	.PARAMETER ldapMapName
	The name of the Directory Map where the LDAP branch will be updated.

	.PARAMETER deleteBranchID
	A 64-bit unique ID of the branch to update

	.EXAMPLE
	Remove-PVLDAPBranch -ldapMapName EU_Users -deleteBranchID 4

	Deletes Ldap Branch with ID of 4 from EU_Users Mapping

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
		[string]$deleteBranchID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath LDAPBRANCHDELETE "$($PSBoundParameters |
                ConvertTo-ParameterString -donotQuote deleteBranchID) OUTPUT (ALL,ENCLOSE)"

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