Function Lock-User{

    <#
    .SYNOPSIS
    	Locks the current User’s CyberArk account.

    .DESCRIPTION
    	Exposes the PACLI Function: "LOCK"
        
    .PARAMETER vault
        The name of the Vault to which the User is logged on.
        
    .PARAMETER user
        The Username of the User who is logged on
        
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
        [Parameter(Mandatory=$False)][int]$sessionID
    )
    
    If(!(Test-ExePreReqs)){
            
            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path        
        $lockUser = Invoke-Expression "$pacli LOCK $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $false
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $true
            
        }
        
    }

}