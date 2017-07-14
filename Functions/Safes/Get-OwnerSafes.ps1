Function Get-OwnerSafes{

    <#
    .SYNOPSIS
    	Lists of the Safes to which the specified Safe Owner has ownership.

    .DESCRIPTION
    	Exposes the PACLI Function: "OWNERSAFESLIST"

    .PARAMETER vault
        The name of the Vault to which the Safe Owner has access.
        
    .PARAMETER user
        The Username of the User carrying out the task
        
    .PARAMETER owner
        The name of the Safe Owner.
        
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
        [Parameter(Mandatory=$True)][String]$owner,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #execute pacli
        $ownerSafesList = Invoke-Expression "$pacli OWNERSAFESLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
            
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            If($ownerSafesList){
            
                ForEach($ownerSafe in $ownerSafesList){
        
                    write-debug $ownerSafe
                    
                    #define hash to hold values
                    $ownerSafes = @{}
                    
                    $values = $ownerSafe | ConvertFrom-PacliOutput
                    
                    #Add array elements to hashtable
                    $ownerSafes.Add("Name",$values[0])
                    $ownerSafes.Add("AccessLevel",$values[1])
                    $ownerSafes.Add("ExpirationDate",$values[2])

                    #return object from hashtable
                    New-Object -TypeName psobject -Property $ownerSafes | 
                        
                        select Name, AccessLevel, ExpirationDate 
                        
                }
            
            }
            
        }
        
    }
    
}