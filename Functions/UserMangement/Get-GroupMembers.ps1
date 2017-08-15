Function Get-GroupMembers {

	<#
    .SYNOPSIS
    	Lists the members of a specified CyberArk group

    .DESCRIPTION
    	Exposes the PACLI Function: "GROUPMEMBERS"

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
		Get-GroupMembers -vault Lab -user administrator -group cybr_admins

		Lists members of the cybr_admins group

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

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli with parameters
		$Return = Invoke-PACLICommand $pacli GROUPMEMBERS "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 2) {

					#Get Range from array
					$values = $Results[$i..($i + 2)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Name"   = $values[0]
						"UserID" = $values[1]

					}

				}

			}

		}

	}

}