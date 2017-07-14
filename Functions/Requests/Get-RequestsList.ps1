Function Get-RequestsList{

    <#
    .SYNOPSIS
    	Lists requests from users who wish to enter Safes that require manual 
        access confirmation from authorized users.

    .DESCRIPTION
    	Exposes the PACLI Function: "REQUESTSLIST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER requestsType
        The type of requests to display. 
        The options are:
        		MY_REQUESTS – your user requests for access.
        		INCOMING_REQUESTS – other users’ requests for you
                    to authorize.
                ALL_REQUESTS – other users’ requests as well as
                    your own user requests (in the  CyberArk Vault
                    version 3.5 and above).

    .PARAMETER requestorPattern
        Pattern of the username of the user who created the request.

    .PARAMETER safePattern
        Pattern of the Safe specified in the request.

    .PARAMETER objectPattern
        Pattern of the file or password specified in the request.
        Note: This parameter specifies the full object name, including
        the folder. Either specify the full name of a specific object, or
        use an asterisk (*) before the object name.

    .PARAMETER waiting
        Whether or not the request is waiting for a response.

    .PARAMETER confirmed
        Whether or not the request is waiting for a confirmation.

    .PARAMETER displayInvalid
        Whether to display all requests or only invalid ones. 
        The options are:
        		ALL_REQUESTS
        		ONLY_VALID
        		ONLY_INVALID

    .PARAMETER includeAlreadyHandled
        Whether to include requests that have already been handled
        in the list of requests.

    .PARAMETER requestID
        The unique ID number of the request.

    .PARAMETER objectsType
        The type of operation that generated this request. 
        Possible values:
        		ALL_OBJECTS
        		GET_FILE
        		GET_PASSWORD
        		OPEN_SAFE
        
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
        [Parameter(Mandatory=$False)][ValidateSet("MY_REQUESTS","INCOMING_REQUESTS","ALL_REQUESTS")][string]$requestsType,
        [Parameter(Mandatory=$False)][string]$requestorPattern,
        [Parameter(Mandatory=$False)][string]$safePattern,
        [Parameter(Mandatory=$False)][string]$objectPattern,
        [Parameter(Mandatory=$False)][switch]$waiting,
        [Parameter(Mandatory=$False)][switch]$confirmed,
        [Parameter(Mandatory=$False)][ValidateSet("ALL_REQUESTS","ONLY_VALID","ONLY_INVALID")][string]$displayInvalid,
        [Parameter(Mandatory=$False)][switch]$includeAlreadyHandled,
        [Parameter(Mandatory=$False)][string]$requestID,
        [Parameter(Mandatory=$False)][ValidateSet("ALL_OBJECTS","GET_FILE","GET_PASSWORD","OPEN_SAFE")][string]$objectsType,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #define hash to hold values
        $details = @{}
        
        $requestsList = Invoke-Expression "$pacli REQUESTSLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
            
            #ignore whitespaces, return string
            Select-String -Pattern "\S" | Out-String
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $false
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
            if($requestsList){
            
                ForEach($request in $requestsList){
                
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