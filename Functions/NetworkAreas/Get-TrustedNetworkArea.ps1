Function Get-TrustedNetworkArea{

    <#
    .SYNOPSIS
    	Lists Trusted Network Areas

    .DESCRIPTION
    	Exposes the PACLI Function: "TRUSTEDNETWORKAREALIST"

    .PARAMETER vault 
	   The name of the Vault in which the Trusted Network Area is defined.
       
    .PARAMETER user 
	   The name of the User carrying out the task.
    
    .PARAMETER trusterName 
	   The User who has access to the Trusted Network Area
    
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
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #execute pacli with parameters
        $getTrustedNetworkArea = (Invoke-Expression "$pacli TRUSTEDNETWORKAREASLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($getTrustedNetworkArea){
                
                #process each result
                foreach($area in $getTrustedNetworkArea){
                    
                    #define hash to hold values
                    $trustedNetworkArea = @{}
                    
                    #split the command output
                    $values = $area | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $trustedNetworkArea.Add("Name",$values[0])
                    $trustedNetworkArea.Add("FromHour",$values[1])
                    $trustedNetworkArea.Add("ToHour",$values[2])
                    $trustedNetworkArea.Add("Active",$values[3])
                    $trustedNetworkArea.Add("MaxViolationCount",$values[4])
                    $trustedNetworkArea.Add("ViolationCount",$values[5])
                    
                    #output object
                    new-object -Type psobject -Property $trustedNetworkArea | select Name, FromHour, ToHour, Active, MaxViolationCount, ViolationCount
                        
                }
            
            }
            
        }
        
    }
    
}