Function Get-SafeOwners{

    <#
    .SYNOPSIS
    	Produces a list of all the Safe Owners of the specified Safe(s).

    .DESCRIPTION
    	Exposes the PACLI Function: "OWNERSLIST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.
        
    .PARAMETER user
        The Username of the User who is logged on.
        
    .PARAMETER safePattern
        The full name or part of the name of the Safe(s) to include in the list. 
        Alternatively, a wildcard can be used in this parameter.
        
    .PARAMETER ownerPattern
        The full name or part of the name of the Owner(s) to include in the list. 
        Alternatively, a wildcard can be used in this parameter.
        
    .PARAMETER includeGroupMembers
        Whether or not to include individual members of Groups in the list.
        
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
        [Parameter(Mandatory=$True)][string]$safePattern,
        [Parameter(Mandatory=$True)][string]$ownerPattern,
        [Parameter(Mandatory=$False)][switch]$includeGroupMembers,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                            
        #execute pacli    
        $ownersList = Invoke-Expression "$pacli OWNERSLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
        
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($ownersList){
            
                ForEach($owner in $ownersList){
        
                    #define hash to hold values
                    $owners = @{}
                    
                    $values = $owner | ConvertFrom-PacliOutput
                    
                    #Add elements to hashtable
                    $owners.Add("Name",$values[0])
                    $owners.Add("Group",$values[1])
                    $owners.Add("SafeName",$values[2])
                    $owners.Add("AccessLevel",$values[3])
                    $owners.Add("OpenDate",$values[4])
                    $owners.Add("OpenState",$values[5])
                    $owners.Add("ExpirationDate",$values[6])
                    $owners.Add("GatewayAccount",$values[7])
                    $owners.Add("ReadOnlyByDefault",$values[8])
                    $owners.Add("SafeID",$values[9])
                    $owners.Add("UserID",$values[10])

                    #return object from hashtable
                    New-Object -TypeName psobject -Property $owners | select Name, Group, SafeName, AccessLevel, OpenDate, 
                        OpenState, ExpirationDate, GatewayAccount, ReadOnlyByDefault, SafeID, UserID
                        
                }
            
            }
            
        }
        
    }
    
}