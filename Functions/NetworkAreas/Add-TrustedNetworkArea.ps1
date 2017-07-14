Function Add-TrustedNetworkArea{

    <#
    .SYNOPSIS
    	Adds a Trusted Network Area from which a CyberArk User can access the 
        CyberArk Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDTRUSTEDNETWORKAREA"

    .PARAMETER vault 
	   The name of the Vault to which to add the Trusted Network Area.
       
    .PARAMETER user 
	   The name of the User carrying out the task.
    
    .PARAMETER trusterName 
	   The User who will have access to the Trusted Network Area.
    
    .PARAMETER networkArea 
	   The name of the Trusted Network Area to add.
    
    .PARAMETER fromHour 
	   The time from which access to the Vault is permitted.
    
    .PARAMETER toHour 
	   The time until which access to the Vault is permitted.
    
    .PARAMETER maxViolationCount
	   The maximum number of access violations permitted before the User is not 
       permitted to access the Vault.
    
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
        [Parameter(Mandatory=$False)][int]$fromHour,
        [Parameter(Mandatory=$False)][int]$toHour,
        [Parameter(Mandatory=$False)][int]$maxViolationCount,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $addTrustedNetworkArea = Invoke-Expression "$pacli ADDTRUSTEDNETWORKAREA $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
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