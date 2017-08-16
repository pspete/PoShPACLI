Function Get-FileVersionsList {

	<#
    .SYNOPSIS
    	Lists the versions of the specified file or password.

    .DESCRIPTION
    	Exposes the PACLI Function: "FILEVERSIONSLIST"

    .PARAMETER vault
        The name of the Vault containing the files to list.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe in which the file is stored.

    .PARAMETER folder
        The name of the folder in which the file is stored.

    .PARAMETER file
        The name of the file or password whose versions will be displayed.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-FileVersionsList -vault lab -user administrator -safe Win_Admins -folder root -file administrator.domain.com

		Lists the versions of the specified file

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
		[Parameter(Mandatory = $True)][string]$file,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli FILEVERSIONSLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 18) {

					#Get Range from array
					$values = $Results[$i..($i + 18)]

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
						"Size"             = $values[10]
						"History"          = $values[11]
						"Draft"            = $values[12]
						"RetrieveLock"     = $values[13]
						"InternalName"     = $values[14]
						"FileID"           = $values[15]
						"LockedByUserID"   = $values[16]
						"ValidationStatus" = $values[17]

					}

				}

			}

		}

	}

}