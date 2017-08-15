﻿Function Search-Files {

	<#
    .SYNOPSIS
    	Finds a particular file, list of files, password, or list of passwords,
        according to the parameters set.

    .DESCRIPTION
    	Exposes the PACLI Function: "FINDFILES"

    .PARAMETER vault
        The name of the Vault containing the file(s) or password(s)
        you are looking for.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe containing the file(s) or password(s)
        you are looking for. You can use a wildcard to specify a
        wider range of safenames.

    .PARAMETER folder
        The name of the folder containing the file(s) or password(s)
        to be found.

    .PARAMETER filePattern
        The full name or part of the name of the file(s) or
        password(s) to list. Alternatively, a wildcard can be used in
        this parameter.

    .PARAMETER fileRetrieved
        Whether or not the report will include retrieved files or
        passwords.

    .PARAMETER fileChanged
        Whether or not the report will include modified files or
        passwords.

    .PARAMETER fileNew
        Whether or not the report will include new files or
        passwords.

    .PARAMETER fileLocked
        Whether or not the report will include locked files or
        passwords.

    .PARAMETER fileWithNoMark
        Whether or not the report will include files or passwords
        without an access mark.

    .PARAMETER includeVersions
        Whether or not the report will include previous versions of
        included files or passwords.

        Note: If the value is set to NO, the ‘deletedoption’
        parameter cannot be set to INCLUDE_DELETED.

    .PARAMETER onlyOpenSafes
        Whether or not the report will search only Safes that are
        currently open

    .PARAMETER includeSubFolders
        Whether or not the search will include subfolders.

    .PARAMETER dateLimit
        A specific time duration.
        Possible values are:
            NONE
            BETWEEN which is qualified by [fromdate] and [todate].
            PREVMONTH which is qualified by [prevcount].
            PREVDAY which is qualified by [prevcount].

    .PARAMETER dateActionLimit
        The activity that took place during the period specified in
        [datelimit].
        Possible values are:
            ACCESSEDFILE
            CREATED
            MODIFIED

    .PARAMETER prevCount
        The number of days or months to be included in the report if
        [datelimit] is specified as ‘PREVMONTH’ or ‘PREVDAY’.

    .PARAMETER fromDate
        The first day to be included in the report if [datelimit] is
        specified as ‘BETWEEN’.
        Use the following date format:
            dd/mm/yyyy.

    .PARAMETER toDate
        The last day to be included in the report if [datelimit] is
        specified as ‘BETWEEN’.
        Use the following date format:
            dd/mm/yyyy.

    .PARAMETER searchInAll
        Whether or not the report will only include files or passwords
        that contain the values specified in the ‘searchinallvalues’
        parameter in their Safe, folder or file/password name, or in
        one of their file categories, as specified in the
        ‘searchinallcategorylist’ parameter.

    .PARAMETER searchInAllAction
        The way that the values in the ‘searchinallvalues’ parameter
        will be searched for if the ‘searchinall’ parameter is set to
        ‘YES’.
        Possible values are:
            ‘OR’ – at least one of the values in the list needs to be
            found.
            ‘AND’ – all the values in the list need to be found.

    .PARAMETER searchInAllValues
        A list of values that should be searched for when the
        ‘searchinall’ parameter is set to ‘YES’. The values in the list
        must be separated by the character specified in the
        ‘listseparator’ parameter.

    .PARAMETER searchInAllCategoryList
        A list of category names to search in when the ‘searchinall’
        parameter is set to ‘YES’. The values in the list must be
        separated by the character specified in the ‘listseparator’
        parameter.

    .PARAMETER listSeparator
        A character that will be used to separate the values in the
        ‘searchinallvalues’, ‘searchinallcategorylist’, ‘categoryidlist’,
        and ‘categoryvalues’ parameters. The default value is “,”
        (comma).

        Note: When a string with more than one character is
        specified, only the first character will be used.

    .PARAMETER deletedOption
        Whether or not deleted files will be shown in the report.
        Possible values are:
            INCLUDE_DELETED_WITH_ACCESSMARKS (default value)
            INCLUDE_DELETED
            ONLY_DELETED
            WITHOUT_DELETED

        Note: If the value is set to INCLUDE_DELETED, the
        ‘includeversions’ parameter cannot be set to NO.

    .PARAMETER sizeLimit
        The file or password size limit in KB for the search, based
        on the ‘sizelimittype’ parameter.

    .PARAMETER sizeLimitType
        The type of file or password size-based search.
        Possible
        values are:
            ATLEAST
            ATMOST

    .PARAMETER categoryIDList
        A list of category IDs according to which the values
        specified in the ‘categoryvalues’ parameter will be searched
        for.

        Note: The first value corresponds to the first category, the
        second value to the second category, etc.
        Only files or passwords that contain the specified file
        categories (according to the ‘categorylistaction’ parameter)
        with the specified values will be returned.

    .PARAMETER categoryValues
        A list of values to search for in the file categories specified
        in the ‘categoryidlist’ parameter.

        Note: The first value corresponds to the first category, the
        second value to the second category, etc.
        Only files or passwords that contain the listed file categories
        (according to the ‘categorylistaction’ parameter) with the
        specified values will be returned.

    .PARAMETER categoryListAction
        Specifies how to search for the values in the ‘categoryidlist’
        and ‘categoryvalues’ parameters.
        Possible values are:
            ‘OR’ – at least one of the values in the list needs to be
            found.
            ‘AND’ – all the values in the list need to be found.

    .PARAMETER includeFileCategories
        Whether or not the search will include file categories in the
        output.

    .PARAMETER fileCategoriesSeparator
        If the ‘includefilecategories’ parameter is set to ‘YES’, this
        character will be written in the search output to separate the
        file categories. The default value is ‘#’.

    .PARAMETER fileCategoryValueSeparator
        If the ‘includefilecategories’ parameter is set to ‘YES’, this
        character will be written in the search output to separate the
        file categories and their values. The default value is ‘:’.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Search-Files -vault Lab -user administrator -safe Reports -folder root

        Finds all files in the root folder of Reports safe.

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
		[Parameter(Mandatory = $False)][string]$filePattern,
		[Parameter(Mandatory = $False)][switch]$fileRetrieved,
		[Parameter(Mandatory = $False)][switch]$fileChanged,
		[Parameter(Mandatory = $False)][switch]$fileNew,
		[Parameter(Mandatory = $False)][switch]$fileLocked,
		[Parameter(Mandatory = $False)][switch]$fileWithNoMark,
		[Parameter(Mandatory = $False)][switch]$includeVersions,
		[Parameter(Mandatory = $False)][switch]$onlyOpenSafes,
		[Parameter(Mandatory = $False)][switch]$includeSubFolders,
		[Parameter(Mandatory = $False)][ValidateSet("NONE", "BETWEEN", "PREVMONTH", "PREVDAY")][string]$dateLimit,
		[Parameter(Mandatory = $False)][ValidateSet("ACCESSEDFILE", "CREATED", "MODIFIED")][string]$dateActionLimit,
		[Parameter(Mandatory = $False)][int]$prevCount,
		[Parameter(Mandatory = $False)]
		[ValidateScript( {($_ -eq (get-date $_ -f dd/MM/yyyy))})]
		[string]$fromDate,
		[Parameter(Mandatory = $False)]
		[ValidateScript( {($_ -eq (get-date $_ -f dd/MM/yyyy))})]
		[string]$toDate,
		[Parameter(Mandatory = $False)][switch]$searchInAll,
		[Parameter(Mandatory = $False)][ValidateSet("OR", "AND")][string]$searchInAllAction,
		[Parameter(Mandatory = $False)][string]$searchInAllValues,
		[Parameter(Mandatory = $False)][string]$searchInAllCategoryList,
		[Parameter(Mandatory = $False)][string]$listSeparator,
		[Parameter(Mandatory = $False)][ValidateSet("INCLUDE_DELETED_WITH_ACCESSMARKS", "INCLUDE_DELETED", "ONLY_DELETED", "WITHOUT_DELETED")]
		[string]$deletedOption,
		[Parameter(Mandatory = $False)][int]$sizeLimit,
		[Parameter(Mandatory = $False)][ValidateSet("ATLEAST", "ATMOST")][string]$sizeLimitType,
		[Parameter(Mandatory = $False)][string]$categoryIDList,
		[Parameter(Mandatory = $False)][string]$categoryValues,
		[Parameter(Mandatory = $False)][ValidateSet("OR", "AND")][string]$categoryListAction,
		[Parameter(Mandatory = $False)][switch]$includeFileCategories,
		[Parameter(Mandatory = $False)][string]$fileCategoriesSeparator,
		[Parameter(Mandatory = $False)][string]$fileCategoryValueSeparator,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli
		$Return = Invoke-PACLICommand $pacli FINDFILES "$($PSBoundParameters.getEnumerator() |
            ConvertTo-ParameterString -donotQuote dateLimit,dateActionLimit,prevCount,
                searchInAllAction,deletedOption,sizeLimit,sizeLimitType,
                    categoryListAction ) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 29) {

					#Get Range from array
					$values = $Results[$i..($i + 29)]

					#Output Object
					[PSCustomObject] @{

						"Name"                       = $values[0]
						"Accessed"                   = $values[1]
						"CreationDate"               = $values[2]
						"CreatedBy"                  = $values[3]
						"DeletionDate"               = $values[4]
						"DeletionBy"                 = $values[5]
						"LastUsedDate"               = $values[6]
						"LastUsedBy"                 = $values[7]
						"LockDate"                   = $values[8]
						"LockedBy"                   = $values[9]
						"LockedByGW"                 = $values[10]
						"Size"                       = $values[11]
						"History"                    = $values[12]
						"InternalName"               = $values[13]
						"Safe"                       = $values[14]
						"Folder"                     = $values[15]
						"FileID"                     = $values[16]
						"LockedByUserID"             = $values[17]
						"ValidationStatus"           = $values[18]
						"HumanCreationDate"          = $values[19]
						"HumanCreatedBy"             = $values[20]
						"HumanLastUsedDate"          = $values[21]
						"HumanLastUsedBy"            = $values[22]
						"HumanLastRetrievedByDate"   = $values[23]
						"HumanLastRetrievedBy"       = $values[24]
						"ComponentCreationDate"      = $values[25]
						"ComponentCreatedBy"         = $values[26]
						"ComponentLastUsedDate"      = $values[27]
						"ComponentLastUsedBy"        = $values[28]
						"ComponentLastRetrievedDate" = $values[26]
						"ComponentLastRetrievedBy"   = $values[27]
						"FileCategories"             = $values[28]

					}

				}

			}

		}

	}

}