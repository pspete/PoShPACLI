Function Get-Folder{

    <#
    .SYNOPSIS
    	Lists folders in the specified Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "FOLDERSLIST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe whose folders will be listed.

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
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #execute pacli    
        $getFolder = Invoke-Expression "$pacli FOLDERSLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
        
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($getFolder){
            
                ForEach($folder in $getFolder){
        
                    #define hash to hold values
                    $folderList = @{}
                    
                    $values = $folder | ConvertFrom-PacliOutput
                    
                    #Add elements to hashtable
                    $folderList.Add("Name",$values[0])
                    $folderList.Add("Accessed",$values[1])
                    $folderList.Add("History",$values[2])
                    $folderList.Add("DeletionDate",$values[3])
                    $folderList.Add("DeletedBy",$values[4])
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $folderList | select Name, Accessed, History, DeletionDate, DeletedBy
                        
                }
            
            }
            
        }
        
    }
    
}