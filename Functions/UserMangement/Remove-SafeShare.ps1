Function Remove-SafeShare{

    <#
    .SYNOPSIS
    	Removes the safe sharing feature through a specific Gateway account. 
        This means that this Safe will no longer be accessible through this 
        Gateway account.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETESAFESHARE"

    .PARAMETER vault
	   The Vault containing the shared Safe.

    .PARAMETER user
	   The Username of the User carrying out the task.

    .PARAMETER safe
	   The Safe from which to remove the sharing feature.

    .PARAMETER gwAccount
	   The name of the Gateway account through which the Safe will not be accessible.
    
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
        [Parameter(Mandatory=$True)][string]$gwAccount,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                
        $deleteSafeShare = (Invoke-Expression "$pacli DELETESAFESHARE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)" -ErrorAction SilentlyContinue) 2>&1

        if($LASTEXITCODE){

            write-debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "Error Deleting Sharing Safe: $safe"
            write-debug $($addSafeShare[0]|out-string)
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "$safe Share via $gwAccount Deleted"
            
        }
        
    }

}