Function Get-SafesLog{

    <#
    .SYNOPSIS
    	Generates a log of activities per Safe in the specified Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "SAFESLOG"
    
    .PARAMETER vault 
    	The name of the Vault containing the Safe.
        
    .PARAMETER user 
	   The Username of the User carrying out the command.
    
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
        [Parameter(Mandatory=$False)][string]$user,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
            
        #execute pacli with parameters
        $safesLog = (Invoke-Expression "$pacli SAFESLOG $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($safesLog){
                
                #process each result
                foreach($safe in $safesLog){
                    
                    #define hash to hold values
                    $safeLogs = @{}
                    
                    #split the command output
                    $values = $safe | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $safeLogs.Add("Name",$values[0])
                    $safeLogs.Add("UsersCount",$values[1])
                    $safeLogs.Add("OpenDate",$values[2])
                    $safeLogs.Add("OpenState",$values[3])
                    
                    #output object
                    new-object -Type psobject -Property $safeLogs | select Name, UsersCount, OpenDate, OpenState
                        
                }
            
            }
            
        }
        
    }
    
}