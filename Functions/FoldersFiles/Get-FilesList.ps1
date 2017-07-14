Function Get-FilesList{

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
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #execute pacli    
        $files = Invoke-Expression "$pacli FILESLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
        
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($files){
            
                ForEach($file in $files){
        
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
                    $filesList.Add("Draft",$values[13])
                    $filesList.Add("RetrieveLock",$values[14])
                    $filesList.Add("InternalName",$values[15])
                    $filesList.Add("FileID",$values[16])
                    $filesList.Add("LockedByUserID",$values[17])
                    $filesList.Add("ValidationStatus",$values[18])
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $filesList | select Name, Accessed, CreationDate, CreatedBy, DeletionDate, DeletionBy, LastUsedDate, LastUsedBy,
                        LockDate, LockedBy, LockedByGW, Size, History, Draft, RetrieveLock, InternalName, FileID, LockedByUserID, ValidationStatus
                        
                }
            
            }
            
        }
        
    }
    
}