Function Get-FileActivity{

    <#
    .SYNOPSIS
    	Inspect activity that has taken place in a specified Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "INSPECTFILE"

    .PARAMETER vault
        The name of the Vault containing the appropriate file.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe containing the file.

    .PARAMETER folder
        The folder containing the file whose activity will be listed.

    .PARAMETER file
        The name of the file or password whose activity will be listed.
        
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
        [Parameter(Mandatory=$True)][string]$vault,
        [Parameter(Mandatory=$True)][string]$user,
        [Parameter(Mandatory=$True)][string]$safe,
        [Parameter(Mandatory=$True)][string]$folder,
        [Parameter(Mandatory=$True)][string]$file,
        [Parameter(Mandatory=$False)][int]$logDays,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #execute pacli    
        $fileActivities = Invoke-Expression "$pacli INSPECTFILE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
        
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($fileActivities){
            
                ForEach($activity in $fileActivities){
        
                    #define hash to hold values
                    $activities = @{}
                    
                    $values = $activity | ConvertFrom-PacliOutput
                    
                    #Add elements to hashtable
                    $activities.Add("Time",$values[0])
                    $activities.Add("User",$values[1])
                    $activities.Add("Activity",$values[2])
                    $activities.Add("PreviousLocation",$values[3])
                    $activities.Add("RequestID",$values[4])
                    $activities.Add("RequestReason",$values[5])
                    $activities.Add("Code",$values[6])
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $activities | select Time, User, Activity, PreviousLocation, RequestID, RequestReason, Code
                        
                }
            
            }
            
        }
        
    }
    
}