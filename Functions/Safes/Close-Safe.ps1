Function Close-Safe{

    <#
    .SYNOPSIS
    	Closes a Safe

    .DESCRIPTION
    	Exposes the PACLI Function: "CLOSESAFE"

    .PARAMETER vault
		The name of the Vault containing the Safes to close.

    .PARAMETER user
		The Username of the User carrying out the task.

    .PARAMETER safe
		The name of the Safe to close.
        
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
                    
        $closeSafe = (Invoke-Expression "$pacli CLOSESAFE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1

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