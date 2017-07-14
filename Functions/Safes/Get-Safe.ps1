Function Get-Safe{

    <#
    .SYNOPSIS
    	Produces a list of Safes in the specified Vault

    .DESCRIPTION
    	Exposes the PACLI Function: "SAFESLIST
        
    .PARAMETER vault
        The name of the Vault containing the Safes to list.
        
    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER location
        The location to search in for the Safes to include in the list.
        Note: Add a backslash ‘\’ before the name of the location.

    .PARAMETER includeSubLocations
        Whether or not in include sublocation(s) of the specified location in 
        the list.

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
        [Parameter(Mandatory=$False)][string]$location,
        [Parameter(Mandatory=$False)][switch]$includeSubLocations,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                            
        #execute pacli
        $safesList = Invoke-Expression "$pacli SAFESLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
            
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"

            if($safesList){
                
                foreach($safe in $safesList){
                    
                    #define hash to hold values
                    $vaultSafe = @{}
                    
                    #remove line break characters in data, 
                    $values = $safe | ConvertFrom-PacliOutput
                
                    #write-debug $values.count
                        
                    #assign values to properties
                    $vaultSafe.Add("Name",$values[0])
                    $vaultSafe.Add("Size",$values[1])
                    $vaultSafe.Add("Status",$values[2])
                    $vaultSafe.Add("LastUsed",$values[3])
                    $vaultSafe.Add("Accessed",$values[4])
                    $vaultSafe.Add("VirusFree",$values[5])
                    $vaultSafe.Add("ShareOptions",$values[6])
                    $vaultSafe.Add("Location",$values[7])
                    $vaultSafe.Add("UseFileCategories",$values[8])
                    $vaultSafe.Add("TextOnly",$values[9])
                    $vaultSafe.Add("RequireReason",$values[10])
                    $vaultSafe.Add("EnforceExclusivePasswords",$values[11])
                    $vaultSafe.Add("RequireContentValidation",$values[12])
                    $vaultSafe.Add("AccessLevel",$values[13])
                    $vaultSafe.Add("MaxSize",$values[14])
                    $vaultSafe.Add("ReadOnlyByDefault",$values[15])
                    $vaultSafe.Add("SafeID",$values[16])
                    $vaultSafe.Add("LocationID",$values[17])
                    $vaultSafe.Add("SupportOLAC",$values[18])
                    
                    #output object
                    new-object -Type psobject -Property $vaultSafe | select Name, Size, Status, LastUsed, Accessed, VirusFree,
                        ShareOptions, Location, UseFileCategories, TextOnly, RequireReason, EnforceExclusivePasswords,
                            RequireContentValidation, AccessLevel, MaxSize, ReadOnlyByDefault, SafeID, LocationID, SupportOLAC
                
                }
                
            }
            
        }
        
    }

}