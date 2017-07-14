Function Get-FileCategories{

    <#
    .SYNOPSIS
    	Lists all the File Categories at both Vault and Safe level for the 
        specified file or password.

    .DESCRIPTION
    	Exposes the PACLI Function: "LISTFILECATEGORIES"

    .PARAMETER vault
        The name of the Vault containing the File Categories.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe that the File Category is attached to.

    .PARAMETER folder
        The folder containing a file with a File Category attached to it.

    .PARAMETER file
        The name of the file or password that is attached to a File Category.
        
    .PARAMETER category
        The name of the File Category.
        
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
        [Parameter(Mandatory=$True)][string]$file,
        [Parameter(Mandatory=$False)][string]$category,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #execute pacli    
        $fileCategories = Invoke-Expression "$pacli LISTFILECATEGORIES $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
        
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($fileCategories){
            
                ForEach($category in $fileCategories){
        
                    #define hash to hold values
                    $categories = @{}
                    
                    $values = $category | ConvertFrom-PacliOutput
                    
                    #Add elements to hashtable
                    $categories.Add("CategoryName",$values[0])
                    $categories.Add("CategoryValue",$values[1])
                    $categories.Add("CategoryID",$values[2])
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $categories | select CategoryName, CategoryValue, CategoryID
                        
                }
            
            }
            
        }
        
    }
    
}