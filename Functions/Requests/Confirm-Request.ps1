Function Confirm-Request{

    <#
    .SYNOPSIS
    	Enables authorized users or groups to confirm a request.

    .DESCRIPTION
    	Exposes the PACLI Function: "CONFIRMREQUEST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe for which the request has been created.
    
    .PARAMETER requestID
        The unique ID number of the request.
    
    .PARAMETER confirm
        Whether to confirm or reject this request.

    .PARAMETER reason
        The reason for the action taken by the authorized user or group.
        
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
        [Parameter(Mandatory=$True)][string]$confirm,
        [Parameter(Mandatory=$False)][string]$reason,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #define hash to hold values
        $details = @{}
        
        $confirmRequest = Invoke-Expression "$pacli CONFIRMREQUEST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
            
            #ignore whitespaces, return string
            Select-String -Pattern "\S" | Out-String
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $false
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
            if($confirmRequest){
            
                ForEach($request in $confirmRequest){
                
                    $values = $request | ConvertFrom-PacliOutput

                    #Add elements to hashtable
                    $details.Add("RequestID",$values[0])
                    $details.Add("User",$values[1])
                    $details.Add("Operation",$values[2])
                    $details.Add("Safe",$values[3])
                    $details.Add("File",$values[4])
                    $details.Add("Confirmed",$values[5])
                    $details.Add("Reason",$values[6])
                    $details.Add("Status",$values[7])
                    $details.Add("InvalidReason",$values[8])
                    $details.Add("Confirmations",$values[9])
                    $details.Add("Rejections",$values[10])
                    $details.Add("ConfirmationsLeft",$values[11])
                    $details.Add("CreationDate",$values[12])
                    $details.Add("LastUsedDate",$values[13])
                    $details.Add("ExpirationDate",$values[14])
                    $details.Add("AccessType",$values[15])
                    $details.Add("UsableFrom",$values[16])
                    $details.Add("UsableTo",$values[17])
                    $details.Add("SafeID",$values[18])
                    $details.Add("UserID",$values[19])
                    $details.Add("FileID",$values[20])                        
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $details | select RequestID, User, Operation, Safe, File, Confirmed, Reason, Status, 
                        InvalidReason, Confirmations, Rejections, ConfirmationsLeft, CreationDate, LastUsedDate, ExpirationDate, AccessType, 
                            UsableFrom, UsableTo, SafeID, UserID, FileID
                
                }
                
            }
            
        }
        
    }

}