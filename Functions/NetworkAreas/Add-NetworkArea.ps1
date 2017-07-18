Function Add-NetworkArea{

    <#
    .SYNOPSIS
    	Adds a new Network Area to the CyberArk Vault environment.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDNETWORKAREA"

    .PARAMETER vault
        The name of the Vault to which the Network Area will be added.
        
    .PARAMETER user
        The name of the User carrying out the task.
        
    .PARAMETER networkArea
        The name of the new Network Area.
        
    .PARAMETER securityLevelParm
        The level of the Network Area security flags.
        
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
        [Parameter(Mandatory=$True)][string]$networkArea,
        [Parameter(Mandatory=$False)]
        [ValidateRange(1,63)][int]$securityLevelParm,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $Return = Invoke-PACLICommand $pacli ADDNETWORKAREA $($PSBoundParameters.getEnumerator() | 
        ConvertTo-ParameterString -donotQuote securityLevelParm)
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr
            $FALSE

        }
        
        else{
        
            $TRUE
            
        }
        
    }

}