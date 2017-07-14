Function Open-Safe{

    <#
    .SYNOPSIS
    	Open a Safe (Safe Owner authorizations required). When the Safe is opened, 
        various details about the Safe will be displayed, depending on the 
        parameters specified.

    .DESCRIPTION
    	Exposes the PACLI Function: "OPENSAFE"
        
    .PARAMETER vault
		The name of the Vault containing the Safes to open.

    .PARAMETER user
		The Username of the User carrying out the task.

    .PARAMETER safe
		The name of the Safe to open.

    .PARAMETER requestUsageType
		The operation that the user will carry out. 
        
        Possible options are:
            REQUEST_AND_USE – create and send a request if
            necessary, or use the confirmation if it has been granted to
            open the Safe/file/password.
		
            CHECK_DON’T_USE – check if a request has been sent or,
            if not, create one and send an error. If a request is not
            needed, carry out the action.
            
            USE_ONLY – if the request has been confirmed, or if a
            request is not needed, open the Safe/file/password.
            
		Note: In version 4.1, this parameter has no default value and
		is obsolete. However, it can still be used as long as the
		‘userequest’, ‘sendrequest’ and ‘executerequest’ parameters
		are not specified.

    .PARAMETER requestAccessType
		Whether the request is for a single or multiple access.
		Possible options are:
		  SINGLE – for a single access.
          
		  MULTIPLE – for multiple accesses.

    .PARAMETER usableFrom
		The proposed date from when the request will be valid.

    .PARAMETER usableTo
		The proposed date until when the request will be valid.

    .PARAMETER requestReason
		The reason for the request.

    .PARAMETER useRequest
		If a confirmed request exists, it will be used.

    .PARAMETER sendRequest
		A request will be sent, if needed.

    .PARAMETER executeRequest
		The action will be executed, if a confirmation exists or is not
		needed.
    
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
        [Parameter(Mandatory=$False)][ValidateSet("REQUEST_AND_USE","CHECK_DON’T_USE","USE_ONLY")][string]$requestUsageType,
        [Parameter(Mandatory=$False)][ValidateSet("SINGLE","MULTIPLE")][string]$requestAccessType,
        [Parameter(Mandatory=$False)][string]$usableFrom,
        [Parameter(Mandatory=$False)][string]$usableTo,
        [Parameter(Mandatory=$False)][string]$requestReason,
        [Parameter(Mandatory=$False)][switch]$useRequest,
        [Parameter(Mandatory=$False)][switch]$sendRequest,
        [Parameter(Mandatory=$False)][switch]$executeRequest,
        [Parameter(Mandatory=$False)][int]$sessionID
    )


    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        $openSafe = (Invoke-Expression "$pacli OPENSAFE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"

        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            #error openeing safe, return false
            $false
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
            #if safe opened/results returned
            if($openSafe){
            
                #process returned results
                foreach($safe in $openSafe){
                    
                    #define hash to hold values
                    $openedSafe = @{}
                    
                    #split the command output
                    $values = $safe | ConvertFrom-PacliOutput
                    
                    #assign values to properties
                    #(these may not be the correct order - but most are)
                    $openedSafe.Add("Name",$values[0])
                    $openedSafe.Add("Status",$values[1])
                    $openedSafe.Add("LastUsed",$values[2])
                    $openedSafe.Add("Accessed",$values[3])
                    $openedSafe.Add("Size",$values[4])
                    $openedSafe.Add("Location",$values[5])
                    $openedSafe.Add("SafeID",$values[6])
                    $openedSafe.Add("LocationID",$values[7])
                    $openedSafe.Add("TextOnly",$values[8])
                    $openedSafe.Add("ShareOptions",$values[9])
                    $openedSafe.Add("UseFileCategories",$values[10])
                    $openedSafe.Add("RequireContentValidation",$values[11])
                    $openedSafe.Add("RequireReason",$values[12])
                    $openedSafe.Add("EnforceExclusivePasswords",$values[13])
                    
                    #output object
                    new-object -Type psobject -Property $openedSafe | select Name, Size, Status, LastUsed, 
                        Accessed, ShareOptions, Location, UseFileCategories, TextOnly, RequireReason, 
                            EnforceExclusivePasswords, RequireContentValidation, SafeID, LocationID
                
                }
            
            }
            
        }
    
    }
    
}