Function Get-Locations{

    <#
    .SYNOPSIS
    	Generates a list of locations, and their allocated quotas.

    .DESCRIPTION
    	Exposes the PACLI Function: "LOCATIONSLIST"

    .PARAMETER vault
       The name of the Vault in which the location is defined.
    
    .PARAMETER user
        The Username of the User who is carrying out the command.
        
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
        $locations = (Invoke-Expression "$pacli LOCATIONSLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($locations){
                
                #process each result
                foreach($location in $locations){
                    
                    #define hash to hold values
                    $locationsList = @{}
                    
                    #split the command output
                    $values = $safe | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $locationsList.Add("Name",$values[0])
                    $locationsList.Add("Quota",$values[1])
                    $locationsList.Add("UsedQuota",$values[2])
                    $locationsList.Add("LocationID",$values[3])
                    
                    #output object
                    new-object -Type psobject -Property $locationsList | select Name, Quota, UsedQuota, LocationID
                        
                }
            
            }
            
        }
        
    }
    
}