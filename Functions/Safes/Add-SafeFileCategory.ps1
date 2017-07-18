Function Add-SafeFileCategory{

    <#
    .SYNOPSIS
    	Adds File Categories at Safe level

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDSAFEFILECATEGORY"

    .PARAMETER vault
        The name of the Vault containing the Safe where the File Category will 
        be added.
        
    .PARAMETER user
        The Username of the User carrying out the task.
        
    .PARAMETER safe
        The Safe where the File Category will be added.
        
    .PARAMETER category
        The name of the File Category.
        
    .PARAMETER type
        The type of File Category. 
        Valid values for this parameter are:
            cat_text – a textual value
            cat_numeric – a numeric value
            cat_list – a list value
            
    .PARAMETER validValues
        The valid values for the File Category.

    .PARAMETER defaultValue
        The default value for the File Category.
        
    .PARAMETER required
        Whether or not the File Category is a requirement when storing a file in 
        the Safe.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True)][string]$vault,
        [Parameter(Mandatory=$True)][string]$user,
        [Parameter(Mandatory=$False)][String]$safe,
        [Parameter(Mandatory=$True)][string]$category,
        [Parameter(Mandatory=$False)][ValidateSet("cat_text","cat_numeric","cat_list")][String]$type,
        [Parameter(Mandatory=$False)][String]$validValues,
        [Parameter(Mandatory=$False)][String]$defaultValue,
        [Parameter(Mandatory=$False)][Switch]$required,
        [Parameter(Mandatory=$False)][int]$sessionID
    )


    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $Return = Invoke-PACLICommand $pacli ADDSAFEFILECATEGORY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr
            $FALSE

        }
        
        else{
        
            $TRUE
            
        }
        
    }
    
}