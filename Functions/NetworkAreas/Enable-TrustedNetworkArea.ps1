Function Enable-TrustedNetworkArea{

    <#
    .SYNOPSIS
    	Activates a Trusted Network Area.

    .DESCRIPTION
    	Exposes the PACLI Function: "ACTIVATETRUSTEDNETWORKAREA"

    .PARAMETER vault 
	   The name of the Vault in which the Trusted Network Area is defined.
       
    .PARAMETER user 
	   The name of the User carrying out the task.
    
    .PARAMETER trusterName 
	   The User who will have access to the Trusted Network Area

    .PARAMETER networkArea 
	   The name of the Trusted Network Area to activate.
           
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
        [Parameter(Mandatory=$True)][string]$trusterName,
        [Parameter(Mandatory=$True)][string]$networkArea,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $enableTrustedNetworkArea = Invoke-Expression "$pacli ACTIVATETRUSTEDNETWORKAREA $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
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