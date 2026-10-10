# .ExternalHelp PoShPACLI-help.xml
function Get-PVFileList {

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
		[string]$folder
	)

	process {

		#execute pacli
		$Return = Invoke-PACLICommand -PacliCommand FILESLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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
							'InternalName'     = $values[1]
							'CreationDate'     = $values[2]
							'CreatedBy'        = $values[3]
							'DeletionDate'     = $values[4]
							'DeletionBy'       = $values[5]
							'LastUsedDate'     = $values[6]
							'LastUsedBy'       = $values[7]
							'Size'             = $values[8]
							'History'          = $values[9]
							'RetrieveLock'     = $values[10]
							'LockDate'         = $values[11]
							'LockedBy'         = $values[12]
							'FileID'           = $values[13]
							'Draft'            = $values[14]
							'Accessed'         = $values[15]
							'LockedByGW'       = $values[16]
							'ValidationStatus' = $values[17]
							'LockedByUserID'   = $values[18]
							'CategoryModificationDate' = $values[19]
							'Safename'         = $safe
							'Folder'           = $folder

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.File

					}

				}

			}

		}

	}

}