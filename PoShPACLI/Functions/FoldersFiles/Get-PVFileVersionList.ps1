Function Get-PVFileVersionList {

	<#
	.SYNOPSIS
	Lists the versions of the specified file or password.

	.DESCRIPTION
	Exposes the PACLI Function: "FILEVERSIONSLIST"

	.PARAMETER safe
	The name of the Safe in which the file is stored.

	.PARAMETER folder
	The name of the folder in which the file is stored.

	.PARAMETER file
	The name of the file or password whose versions will be displayed.

	.EXAMPLE
	Get-PVFileVersionList -safe Win_Admins -folder root `
	-file administrator.domain.com

	Lists the versions of the specified file

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Filename")]
		[string]$file
	)

	PROCESS {

		#execute pacli
		$Return = Invoke-PACLICommand $Script:PV.ClientPath FILEVERSIONSLIST "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 18) {

					#Get Range from array
					$values = $Results[$i..($i + 18)]

					#Output Object
					[PSCustomObject] @{

						"Filename"         = $values[0]
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
						"Safename"         = $safe
						"Folder"           = $folder

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.File

				}

			}

		}

	}

}