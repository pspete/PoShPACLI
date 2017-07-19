Function Remove-SafeFileCategory{

    <#
    .SYNOPSIS
    	Deletes a File Category at Safe level.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETESAFEFILECATEGORY"

    .PARAMETER vault
        The name of the Vault containing the Safe where the File Category is 
        defined.
        
    .PARAMETER user
        The Username of the User carrying out the task.
        
    .PARAMETER safe
        The Safe where the File Categories is defined.
        
    .PARAMETER category
        The name of the File Category to delete.

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
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $Return = Invoke-PACLICommand $pacli DELETESAFEFILECATEGORY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr
            $FALSE

        }
        
        else{
        
            $TRUE
            
        }
        
    }
    
}