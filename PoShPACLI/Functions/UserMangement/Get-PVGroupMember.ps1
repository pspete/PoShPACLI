Function Get-PVGroupMember {

	<#
	.SYNOPSIS
	Lists the members of a specified CyberArk group

	.DESCRIPTION
	Exposes the PACLI Function: "GROUPMEMBERS"

	.PARAMETER group
	The name of the group

	.EXAMPLE
	Get-PVGroupMember -group cybr_admins

	Lists members of the cybr_admins group

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

		$Return = Invoke-PACLICommand $Script:PV.ClientPath GROUPMEMBERS "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 2) {

					#Get Range from array
					$values = $Results[$i..($i + 2)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Groupname" = $group
						"Username"  = $values[0]
						"UserID"    = $values[1]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Group.Member

				}

			}

		}

	}

}