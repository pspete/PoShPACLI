Function Update-LDAPBranch{

    <#
    .SYNOPSIS
    	Updates an existing LDAP branch in a CyberArk Directory Map

    .DESCRIPTION
    	Exposes the PACLI Function: "LDAPBRANCHUPDATE"

    .PARAMETER vault 
		The name of the Vault.

    .PARAMETER user 
		The Username of the User who is logged on.

    .PARAMETER ldapMapName
		The name of the Directory Map where the LDAP branch will be updated.

    .PARAMETER updateBranchID
		A 64-bit unique ID of the branch to update       

    .PARAMETER ldapDirName 
		The name of the LDAP directory.

    .PARAMETER ldapBranchName 
		The DN of the LDAP directory branch.

    .PARAMETER ldapQuery 
		The LDAP filter that is applied to objects in the specified branch.

    .PARAMETER ldapGroupMatch 
		A regular expression used to filter LDAP groups of objects in the branch.
        
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
        [Parameter(Mandatory=$True)][string]$ldapMapName,
        [Parameter(Mandatory=$True)][string]$updateBranchID,
        [Parameter(Mandatory=$True)][string]$ldapDirName,
        [Parameter(Mandatory=$True)][string]$ldapBranchName,
        [Parameter(Mandatory=$False)][string]$ldapQuery,
        [Parameter(Mandatory=$False)][string]$ldapGroupMatch,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #execute pacli with parameters
        $updateLDAPBranch = (Invoke-Expression "$pacli LDAPBRANCHUPDATE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($updateLDAPBranch){
                
                #process each result
                foreach($branch in $updateLDAPBranch){
                    
                    #define hash to hold values
                    $ldapBranch = @{}
                    
                    #split the command output
                    $values = $branch | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $ldapBranch.Add("LDAPBranchID",$values[0])
                    $ldapBranch.Add("LDAPMapID",$values[1])
                    $ldapBranch.Add("LDAPMapName",$values[2])
                    $ldapBranch.Add("LDAPDirName",$values[3])
                    $ldapBranch.Add("LDAPBranchName",$values[4])
                    $ldapBranch.Add("LDAPQuery",$values[5])
                    $ldapBranch.Add("LDAPGroupMatch",$values[6])
                    
                    #output object
                    new-object -Type psobject -Property $ldapBranch | select LDAPBranchID, LDAPMapID, LDAPMapName, LDAPDirName,
                        LDAPBranchName, LDAPQuery, LDAPGroupMatch
                        
                }
            
            }
            
        }
    
    }
    
}