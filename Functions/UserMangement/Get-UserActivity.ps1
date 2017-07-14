Function Get-UserActivity{

    <#
    .SYNOPSIS
    	This command generates a list of activities carried out in the specified 
        Vault for the user who issues this command. 
        The Safes included in the output are those to which the User carrying out 
        the command has authorization.

    .DESCRIPTION
    	Exposes the PACLI Function: "INSPECTUSER"

    .PARAMETER vault
        The name of the Vault to which the User has access
        
    .PARAMETER user
        The Username of the User issuing the command
        
    .PARAMETER logDays
        The number of days to include in the list of activities.
        
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
        [Parameter(Mandatory=$False)][int]$logDays,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
            
        #execute pacli with parameters
        $userActivity = (Invoke-Expression "$pacli INSPECTUSER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($userActivity){
                
                #process each result
                foreach($activity in $userActivity){
                    
                    #define hash to hold values
                    $activities = @{}
                    
                    #split the command output
                    $values = $user | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $activities.Add("Time",$values[0])
                    $activities.Add("User",$values[1])
                    $activities.Add("Safe",$values[2])
                    $activities.Add("Activity",$values[3])
                    $activities.Add("Location",$values[4])
                    $activities.Add("NewLocation",$values[5])
                    $activities.Add("RequestID",$values[6])
                    $activities.Add("RequestReason",$values[7])
                    $activities.Add("Code",$values[8])
                    
                    #output object
                    new-object -Type psobject -Property $activities | select Time, User, Safe, 
                        Activity, Location, NewLocation, RequestID, RequestReason, Code
                        
                }
            
            }
            
        }
        
    }
    
}