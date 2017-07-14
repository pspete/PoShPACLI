Function Get-NetworkArea{

    <#
    .SYNOPSIS
    	Lists all of the Network Areas that are defined in the Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "NETWORKAREASLIST"

    .PARAMETER vault
        The name of the Vault in which the Network Area is defined.
        
    .PARAMETER user
        The name of the User carrying out the task.
        
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
                    
        #execute pacli with parameters
        $getNetworkArea = (Invoke-Expression "$pacli NETWORKAREASLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($getNetworkArea){
                
                #process each result
                foreach($area in $getNetworkArea){
                    
                    #define hash to hold values
                    $networkArea = @{}
                    
                    #split the command output
                    $values = $area | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $networkArea.Add("Name",$values[0])
                    $networkArea.Add("SecurityLevel",$values[1])
                    
                    #output object
                    new-object -Type psobject -Property $networkArea | select Name, SecurityLevel
                        
                }
            
            }
            
        }
        
    }
    
}