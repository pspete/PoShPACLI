Function Disconnect-Vault{

    <#
    .SYNOPSIS
    	This command enables log off from the Vault

    .DESCRIPTION
    	Exposes the PACLI Function: "LOGOFF"
    
    .PARAMETER vault
        The name of the Vault to log off from.
        
    .PARAMETER user
        The name of the User who is logging off.
        
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
        [Parameter(Mandatory=$True)]$vault,
        [Parameter(Mandatory=$True)]$user,
        [Parameter(Mandatory=$False)]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path

        Write-Verbose "Logging off from Vault"
        
        $pacliLogoff = (Invoke-Expression "$pacli LOGOFF $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1

        if($LASTEXITCODE){
            
            Write-Debug "LastExitCode: $LASTEXITCODE"
            Write-Debug $pacliLogoff
            $false
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $true
            
        }
        
    }

}
