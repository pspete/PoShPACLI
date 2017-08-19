Function Get-PVGroup {

	<#
    .SYNOPSIS
    	Returns details of a CyberArk group.

    .DESCRIPTION
    	Exposes the PACLI Function: "GROUPDETAILS"

    .PARAMETER vault
       The name of the Vault in which the group is defined.

    .PARAMETER user
        The Username of the User who is carrying out the command.

    .PARAMETER group
        The name of the group

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVGroup -vault Lab -user administrator -group cybr_admins -sessionID 0

		Lists details for cybr_admins group

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$group,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli with parameters
		$Return = Invoke-PACLICommand $pacli GROUPDETAILS "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 6) {

					#Get Range from array
					$values = $Results[$i..($i + 6)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Description"   = $values[0]
						"LDAPFullDN"    = $values[1]
						"LDAPDirectory" = $values[2]
						"MapID"         = $values[3]
						"MapName"       = $values[4]
						"ExternalGroup" = $values[5]

					}

				}

			}

		}

	}

}