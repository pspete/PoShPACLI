Function Get-FilesList {

	<#
    .SYNOPSIS
    	Produces a list of files or passwords in the specified Safe that match
        the criteria that is declared.

    .DESCRIPTION
    	Exposes the PACLI Function: "FILESLIST"

    .PARAMETER vault
        The name of the Vault containing the files to list.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe containing the files to list.

    .PARAMETER folder
        The name of the folder containing the files to list.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Get-FilesList -vault lab -user administrator -safe Reports -folder root

		Lists files in the Reports safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$folder,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli FILESLIST "$($PSBoundParameters.getEnumerator() |

		ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)" -DoNotWait

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 19) {

					#Get Range from array
					$values = $Results[$i..($i + 19)]

					#Output Object
					[PSCustomObject] @{

						"Name"             = $values[0]
						"Accessed"         = $values[1]
						"CreationDate"     = $values[2]
						"CreatedBy"        = $values[3]
						"DeletionDate"     = $values[4]
						"DeletionBy"       = $values[5]
						"LastUsedDate"     = $values[6]
						"LastUsedBy"       = $values[7]
						"LockDate"         = $values[8]
						"LockedBy"         = $values[9]
						"LockedByGW"       = $values[10]
						"Size"             = $values[11]
						"History"          = $values[12]
						"Draft"            = $values[13]
						"RetrieveLock"     = $values[14]
						"InternalName"     = $values[15]
						"FileID"           = $values[16]
						"LockedByUserID"   = $values[17]
						"ValidationStatus" = $values[18]

					}

				}

			}

		}

	}

}