# .ExternalHelp PoShPACLI-help.xml
function Get-PVFileVersionList {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Filename')]
		[string]$file
	)

	process {

		#execute pacli
		$Return = Invoke-PACLICommand -PacliCommand FILEVERSIONSLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

							'Filename'         = $values[0]
							'Accessed'         = $values[1]
							'CreationDate'     = $values[2]
							'CreatedBy'        = $values[3]
							'DeletionDate'     = $values[4]
							'DeletionBy'       = $values[5]
							'LastUsedDate'     = $values[6]
							'LastUsedBy'       = $values[7]
							'LockDate'         = $values[8]
							'LockedBy'         = $values[9]
							'Size'             = $values[10]
							'History'          = $values[11]
							'Draft'            = $values[12]
							'RetrieveLock'     = $values[13]
							'InternalName'     = $values[14]
							'FileID'           = $values[15]
							'LockedByUserID'   = $values[16]
							'ValidationStatus' = $values[17]
							'Safename'         = $safe
							'Folder'           = $folder

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.File

					}

				}

			}

		}

	}

}