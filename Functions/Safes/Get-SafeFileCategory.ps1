Function Get-SafeFileCategory{

    <#
    .SYNOPSIS
    	Lists all the File Categories that are available in the specified Safe

    .DESCRIPTION
    	Exposes the PACLI Function: "LISTSAFEFILECATEGORIES"

    .PARAMETER vault
        The name of the Vault containing the Safe where the File Category is 
        defined.
        
    .PARAMETER user
        The Username of the User carrying out the task.
        
    .PARAMETER safe
        The Safe where the File Categories is defined.
        
    .PARAMETER category
        The name of the File Category to list.

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
        [Parameter(Mandatory=$False)][string]$safe,
        [Parameter(Mandatory=$False)][string]$category,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #execute pacli    
        $categoriesList = Invoke-Expression "$pacli LISTSAFEFILECATEGORIES $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
        
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($categoriesList){
            
                ForEach($category in $categoriesList){
        
                    #define hash to hold values
                    $categoryList = @{}
                    
                    $values = $category | ConvertFrom-PacliOutput
                    
                    #Add elements to hashtable
                    $categoryList.Add("CategoryID",$values[0])
                    $categoryList.Add("CategoryName",$values[1])
                    $categoryList.Add("CategoryType",$values[2])
                    $categoryList.Add("CategoryValidValues",$values[3])
                    $categoryList.Add("CategoryDefaultValue",$values[4])
                    $categoryList.Add("CategoryRequired",$values[5])
                    $categoryList.Add("VaultCategory",$values[6])

                    #return object from hashtable
                    New-Object -TypeName psobject -Property $categoryList | select CategoryID, CategoryName, CategoryType, CategoryValidValues, 
                        CategoryDefaultValue, CategoryRequired, VaultCategory
                        
                }
            
            }
            
        }
        
    }
    
}