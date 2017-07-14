Function Get-VaultUsers{

    <#
    .SYNOPSIS
    	Produces a list of Users who have access to the specified Vault.
        You can only generate this list if you have administrative permissions.

    .DESCRIPTION
    	Exposes the PACLI Function: "USERSLIST"

    .PARAMETER vault
	   The name of the Vault

    .PARAMETER user
	   The Username of the User who is logged on.

    .PARAMETER location
	   The location to search for users.
	   Note: A backslash ‘\’ must be added before the name of the location.

    .PARAMETER includeSubLocations
	   Whether or not the output will include the sublocation in which the User 
       is defined.

    .PARAMETER includeDisabledUsers
	   Whether or not the output will include disabled users

    .PARAMETER onlyKnownUsers
	   Whether or not the output will include only Users who share Safes with 
       the User carrying out the command or all Users known by the specified Vault

    .PARAMETER userPattern
	   The full name or part of the name of the User(s) to include in the report. 
       A wildcard can also be used in this parameter.

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
        [Parameter(Mandatory=$False)][string]$location = "\",
        [Parameter(Mandatory=$False)][switch]$includeSubLocations,
        [Parameter(Mandatory=$False)][switch]$includeDisabledUsers,
        [Parameter(Mandatory=$False)][switch]$onlyKnownUsers,
        [Parameter(Mandatory=$False)][string]$userPattern,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
            
        #execute pacli with parameters
        $usersList = (Invoke-Expression "$pacli USERSLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($usersList){
                
                #process each result
                foreach($user in $usersList){
                    
                    #define hash to hold values
                    $vaultUser = @{}
                    
                    #split the command output
                    $values = $user | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $vaultUser.Add("Name",$values[0])
                    $vaultUser.Add("Quota",$values[1])
                    $vaultUser.Add("UsedQuota",$values[2])
                    $vaultUser.Add("Location",$values[3])
                    $vaultUser.Add("FirstName",$values[4])
                    $vaultUser.Add("LastName",$values[5])
                    $vaultUser.Add("LDAPUser",$values[6])
                    $vaultUser.Add("Template",$values[7])
                    $vaultUser.Add("GWAccount",$values[8])
                    $vaultUser.Add("Disabled",$values[9])
                    $vaultUser.Add("Type",$values[10])
                    $vaultUser.Add("UserID",$values[11])
                    $vaultUser.Add("LocationID",$values[12])
                    $vaultUser.Add("EnableComponentMonitoring",$values[13])
                    
                    #output object
                    new-object -Type psobject -Property $vaultUser | select Name, Quota, UsedQuota, 
                        Location, FirstName, LastName, LDAPUser, Template, GWAccount, Disabled, 
                            Type, UserID, LocationID, EnableComponentMonitoring
                
                }
            
            }
            
        }
    
    }
    
}