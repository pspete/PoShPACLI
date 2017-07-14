Function Remove-VaultDefinition{

    <#
    .SYNOPSIS
    	Deletes a Vault definition

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEVAULT"

    .PARAMETER vault
        The name of the Vault to delete.
        
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
        [Parameter(Mandatory=$False)][string]$vault,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
            
        $removeVault = (Invoke-Expression "$pacli DELETEVAULT $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)" -ErrorAction SilentlyContinue) 2>&1
        
        if($LASTEXITCODE){

            write-debug "LastExitCode: $LASTEXITCODE"
            $false
            
        }
        
        Else{
            
            write-debug "LastExitCode: $LASTEXITCODE"
            $true
            
        }  
        
    }  

}