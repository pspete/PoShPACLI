# .ExternalHelp PoShPACLI-help.xml
function Find-PVFile {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('safename')]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$filePattern,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$fileRetrieved,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$fileChanged,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$fileNew,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$fileLocked,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$fileWithNoMark,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeVersions,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$onlyOpenSafes,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeSubFolders,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('NONE', 'BETWEEN', 'PREVMONTH', 'PREVDAY')]
		[string]$dateLimit,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('ACCESSEDFILE', 'CREATED', 'MODIFIED')]
		[string]$dateActionLimit,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$prevCount,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[datetime]$fromDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[datetime]$toDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$searchInAll,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('OR', 'AND')]
		[string]$searchInAllAction,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$searchInAllValues,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$searchInAllCategoryList,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$listSeparator,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('INCLUDE_DELETED_WITH_ACCESSMARKS', 'INCLUDE_DELETED', 'ONLY_DELETED', 'WITHOUT_DELETED')]
		[string]$deletedOption,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sizeLimit,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('ATLEAST', 'ATMOST')]
		[string]$sizeLimitType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$categoryIDList,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$categoryValues,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('OR', 'AND')]
		[string]$categoryListAction,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$includeFileCategories,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fileCategoriesSeparator,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fileCategoryValuesSeparator
	)

	process {

		('fromDate', 'toDate') | ForEach-Object {

			if ($PSBoundParameters.ContainsKey($_)) {

				$PSBoundParameters[$_] = (Get-Date $($PSBoundParameters[$_]) -Format dd/MM/yyyy)

			}

		}

		#execute pacli
		$Return = Invoke-PACLICommand -PacliCommand FINDFILES -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString -donotQuote dateLimit,dateActionLimit,prevCount,
					searchInAllAction,deletedOption,sizeLimit,sizeLimitType,
						categoryListAction ) OUTPUT (ALL,ENCLOSE)"

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

							'Filename'                   = $values[0]
							'Accessed'                   = $values[1]
							'CreationDate'               = $values[2]
							'CreatedBy'                  = $values[3]
							'DeletionDate'               = $values[4]
							'DeletionBy'                 = $values[5]
							'LastUsedDate'               = $values[6]
							'LastUsedBy'                 = $values[7]
							'LockDate'                   = $values[8]
							'LockedBy'                   = $values[9]
							'LockedByGW'                 = $values[10]
							'Size'                       = $values[11]
							'History'                    = $values[12]
							'InternalName'               = $values[13]
							'Safe'                       = $values[14]
							'Folder'                     = $values[15]
							'FileID'                     = $values[16]
							'LockedByUserID'             = $values[17]
							'ValidationStatus'           = $values[18]
							'HumanCreationDate'          = $values[19]
							'HumanCreatedBy'             = $values[20]
							'HumanLastUsedDate'          = $values[21]
							'HumanLastUsedBy'            = $values[22]
							'HumanLastRetrievedByDate'   = $values[23]
							'HumanLastRetrievedBy'       = $values[24]
							'ComponentCreationDate'      = $values[25]
							'ComponentCreatedBy'         = $values[26]
							'ComponentLastUsedDate'      = $values[27]
							'ComponentLastUsedBy'        = $values[28]
							'ComponentLastRetrievedDate' = $values[29]
							'ComponentLastRetrievedBy'   = $values[30]
							'FileCategories'             = $values[31]

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.File

					}

				}

			}

		}
	}

}