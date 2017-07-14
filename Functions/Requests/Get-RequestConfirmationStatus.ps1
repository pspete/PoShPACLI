Function Get-RequestConfirmationStatus{

    <#
    .SYNOPSIS
    	Displays the status of confirmation for a specific request.

    .DESCRIPTION
    	Exposes the PACLI Function: "REQUESTCONFIRMATIONSTATUS"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe for which the request has been created.
    
    .PARAMETER requestID
        The unique ID number of the request.
    
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
        [Parameter(Mandatory=$True)][string]$requestID,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #define hash to hold values
        $details = @{}
        
        $requestStatus = Invoke-Expression "$pacli REQUESTCONFIRMATIONSTATUS $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
            
            #ignore whitespaces, return string
            Select-String -Pattern "\S" | Out-String
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
            if($requestStatus){
            
                ForEach($request in $requestStatus){
                
                    $values = $request | ConvertFrom-PacliOutput

                    #Add elements to hashtable
                    $details.Add("UserName",$values[0])
                    $details.Add("GroupName",$values[1])
                    $details.Add("Action",$values[2])
                    $details.Add("ActionDate",$values[3])
                    $details.Add("Reason",$values[4])
                    $details.Add("UserID",$values[5])
                    $details.Add("GroupID",$values[6])
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $details | select UserName, GroupName, Action, ActionDate, Reason, UserID, GroupID
                
                }
                
            }
            
        }
        
    }

}