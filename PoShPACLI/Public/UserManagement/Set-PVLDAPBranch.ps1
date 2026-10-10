# .ExternalHelp PoShPACLI-help.xml
function Set-PVLDAPBranch {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification = 'ShouldProcess handling is in Invoke-PACLICommand')]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapMapName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('LDAPBranchID')]
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

	process {

		$Return = Invoke-PACLICommand -PacliCommand LDAPBRANCHUPDATE -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString -donotQuote updateBranchID) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = @($Return.StdOut | ConvertFrom-PacliOutput)

				#if records returned
				If ($Results) {

					#loop through results
					foreach ($values in $Results) {

						#Output Object
						[PSCustomObject] @{

							'LDAPBranchID'   = $values[0]
							'LDAPMapID'      = $values[1]
							'LDAPMapName'    = $values[2]
							'LDAPDirName'    = $values[3]
							'LDAPBranchName' = $values[4]
							'LDAPQuery'      = $values[5]
							'LDAPGroupMatch' = $values[6]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.LDAP.Branch

					}

				}

			}

		}

	}

}