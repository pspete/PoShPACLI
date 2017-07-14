Function Remove-SafeOwner{

    <#
    .SYNOPSIS
    	Deletes a Safe Owner, thus removing their permissions and authority to 
        enter the Safe.
        In order to carry out this command successfully, the Safe must be open.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEOWNER"

    .PARAMETER vault
        The name of the Vault to which the Safe Owner has access.
        
    .PARAMETER user
        The Username of the User carrying out the task
        
    .PARAMETER owner
        The name of the Safe Owner to remove from the Vault.
        
    .PARAMETER safe
        The name of the Safe from which to remove the Safe Owner.
        
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
        [Parameter(Mandatory=$True)][String]$safe,
        [Parameter(Mandatory=$True)][String]$owner,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $deleteOwner = (Invoke-Expression "$pacli DELETEOWNER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1

        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
    }
    
}