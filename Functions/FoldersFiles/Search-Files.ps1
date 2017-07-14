Function Search-Files{

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
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: January 2015
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True)][string]$vault,
        [Parameter(Mandatory=$True)][string]$user,
        [Parameter(Mandatory=$True)][string]$safe,
        [Parameter(Mandatory=$True)][string]$folder,
        [Parameter(Mandatory=$True)][string]$filePattern,
        [Parameter(Mandatory=$True)][switch]$fileRetrieved,
        [Parameter(Mandatory=$False)][switch]$fileChanged,
        [Parameter(Mandatory=$False)][switch]$fileNew,
        [Parameter(Mandatory=$False)][switch]$fileLocked,
        [Parameter(Mandatory=$False)][switch]$fileWithNoMark,
        [Parameter(Mandatory=$False)][switch]$includeVersions,
        [Parameter(Mandatory=$False)][switch]$onlyOpenSafes,
        [Parameter(Mandatory=$False)][switch]$includeSubFolders,
        [Parameter(Mandatory=$False)][ValidateSet("NONE","BETWEEN","PREVMONTH","PREVDAY")][string]$dateLimit,
        [Parameter(Mandatory=$False)][ValidateSet("ACCESSEDFILE","CREATED","MODIFIED")][string]$dateActionLimit,
        [Parameter(Mandatory=$False)][int]$prevCount,
        [Parameter(Mandatory=$False)]
            [ValidateScript({($_ -eq (get-date $_ -f dd/MM/yyyy))})]
                [string]$fromDate,
        [Parameter(Mandatory=$False)]
            [ValidateScript({($_ -eq (get-date $_ -f dd/MM/yyyy))})]
                [string]$toDate,
        [Parameter(Mandatory=$False)][switch]$searchInAll,
        [Parameter(Mandatory=$False)][ValidateSet("OR","AND")][string]$searchInAllAction,
        [Parameter(Mandatory=$False)][string]$searchInAllValues,
        [Parameter(Mandatory=$False)][string]$searchInAllCategoryList,
        [Parameter(Mandatory=$False)][string]$listSeparator,
        [Parameter(Mandatory=$False)][ValidateSet("INCLUDE_DELETED_WITH_ACCESSMARKS","INCLUDE_DELETED","ONLY_DELETED","WITHOUT_DELETED")]
            [string]$deletedOption,
        [Parameter(Mandatory=$False)][int]$sizeLimit,
        [Parameter(Mandatory=$False)][ValidateSet("ATLEAST","ATMOST")][string]$sizeLimitType,
        [Parameter(Mandatory=$False)][string]$categoryIDList,
        [Parameter(Mandatory=$False)][string]$categoryValues,
        [Parameter(Mandatory=$False)][ValidateSet("OR","AND")][string]$categoryListAction,
        [Parameter(Mandatory=$False)][switch]$includeFileCategories,
        [Parameter(Mandatory=$False)][string]$fileCategoriesSeparator,
        [Parameter(Mandatory=$False)][string]$fileCategoryValueSeparator,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                            
        #execute pacli    
        $searchFiles = Invoke-Expression "$pacli FINDFILES $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
        
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($searchFiles){
            
                ForEach($file in $searchFiles){
        
                    #define hash to hold values
                    $filesList = @{}
                    
                    $values = $file | ConvertFrom-PacliOutput
                    
                    #Add elements to hashtable
                    $filesList.Add("Name",$values[0])
                    $filesList.Add("Accessed",$values[1])
                    $filesList.Add("CreationDate",$values[2])
                    $filesList.Add("CreatedBy",$values[3])
                    $filesList.Add("DeletionDate",$values[4])
                    $filesList.Add("DeletionBy",$values[5])
                    $filesList.Add("LastUsedDate",$values[6])
                    $filesList.Add("LastUsedBy",$values[7])
                    $filesList.Add("LockDate",$values[8])
                    $filesList.Add("LockedBy",$values[9])
                    $filesList.Add("LockedByGW",$values[10])
                    $filesList.Add("Size",$values[11])
                    $filesList.Add("History",$values[12])
                    $filesList.Add("InternalName",$values[13])
                    $filesList.Add("Safe",$values[14])
                    $filesList.Add("Folder",$values[15])
                    $filesList.Add("FileID",$values[16])
                    $filesList.Add("LockedByUserID",$values[17])
                    $filesList.Add("ValidationStatus",$values[18])
                    $filesList.Add("HumanCreationDate",$values[19])
                    $filesList.Add("HumanCreatedBy",$values[20])
                    $filesList.Add("HumanLastUsedDate",$values[21])                
                    $filesList.Add("HumanLastUsedBy",$values[22])
                    $filesList.Add("HumanLastRetrievedByDate",$values[23])
                    $filesList.Add("HumanLastRetrievedBy",$values[24])
                    $filesList.Add("ComponentCreationDate",$values[25])
                    $filesList.Add("ComponentCreatedBy",$values[26])
                    $filesList.Add("ComponentLastUsedDate",$values[27])
                    $filesList.Add("ComponentLastUsedBy",$values[28])   
                    $filesList.Add("ComponentLastRetrievedDate",$values[26])
                    $filesList.Add("ComponentLastRetrievedBy",$values[27])
                    $filesList.Add("FileCategories",$values[28])   
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $filesList | select Name, Accessed, CreationDate, CreatedBy, DeletionDate, DeletionBy, LastUsedDate, LastUsedBy,
                        LockDate, LockedBy, LockedByGW, Size, History, InternalName, Safe, Folder, FileID, LockedByUserID, ValidationStatus, HumanCreationDate, HumanCreatedBy,
                            HumanLastUsedDate, HumanLastUsedBy, HumanLastRetrievedByDate, HumanLastRetrievedBy, ComponentCreationDate, ComponentCreatedBy, ComponentLastUsedDate,
                                ComponentLastUsedBy, ComponentLastRetrievedDate, ComponentLastRetrievedBy, FileCategories
                        
                }
            
            }
            
        }
        
    }
    
}