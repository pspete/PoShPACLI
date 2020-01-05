Function Get-PVFileList {

	<#
	.SYNOPSIS
	Produces a list of files or passwords in the specified Safe that match
	the criteria that is declared.

	.DESCRIPTION
	Exposes the PACLI Function: "FILESLIST"

	.PARAMETER safe
	The name of the Safe containing the files to list.

	.PARAMETER folder
	The name of the folder containing the files to list.

	.EXAMPLE
	Get-PVFileList -safe Reports -folder root

	Lists files in the Reports safe

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
		[string]$folder
	)

	PROCESS {

		#execute pacli
		$Return = Invoke-PACLICommand $Script:PV.ClientPath FILESLIST "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 19) {

					#Get Range from array
					$values = $Results[$i..($i + 19)]

					#Output Object
					[PSCustomObject] @{

						"Filename"         = $values[0]
						"InternalName"     = $values[1]
						"CreationDate"     = $values[2]
						"CreatedBy"        = $values[3]
						"DeletionDate"     = $values[4]
						"DeletionBy"       = $values[5]
						"LastUsedDate"     = $values[6]
						"LastUsedBy"       = $values[7]
						"Size"             = $values[8]
						"History"          = $values[9]
						"RetrieveLock"     = $values[10]
						"LockDate"         = $values[11]
						"LockedBy"         = $values[12]
						"FileID"           = $values[13]
						"Draft"            = $values[14]
						"Accessed"         = $values[15]
						"LockedByGW"       = $values[16]
						"ValidationStatus" = $values[17]
						"LockedByUserID"   = $values[18]
						"Safename"         = $safe
						"Folder"           = $folder

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.File

				}

			}

		}

	}

}