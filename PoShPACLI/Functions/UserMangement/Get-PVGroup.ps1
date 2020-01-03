Function Get-PVGroup {

	<#
	.SYNOPSIS
	Returns details of a CyberArk group.

	.DESCRIPTION
	Exposes the PACLI Function: "GROUPDETAILS"

	.PARAMETER group
	The name of the group

	.EXAMPLE
	Get-PVGroup -group cybr_admins

	Lists details for cybr_admins group

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Groupname")]
		[string]$group
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath GROUPDETAILS "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 6) {

					#Get Range from array
					$values = $Results[$i..($i + 6)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Groupname"     = $group
						"Description"   = $values[0]
						"LDAPFullDN"    = $values[1]
						"LDAPDirectory" = $values[2]
						"MapID"         = $values[3]
						"MapName"       = $values[4]
						"ExternalGroup" = $values[5]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Group

				}

			}

		}

	}

}