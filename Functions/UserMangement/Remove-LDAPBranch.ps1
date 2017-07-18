Function Remove-LDAPBranch{

    <#
    .SYNOPSIS
    	Deletes an LDAP branch from a CyberArk Directory Map

    .DESCRIPTION
    	Exposes the PACLI Function: "LDAPBRANCHDELETE"

    .PARAMETER vault 
		The name of the Vault.

    .PARAMETER user 
		The Username of the User who is logged on.

    .PARAMETER ldapMapName
		The name of the Directory Map where the LDAP branch will be updated.

    .PARAMETER deleteBranchID
		A 64-bit unique ID of the branch to update       

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True)][string]$vault,
        [Parameter(Mandatory=$True)][string]$user,
        [Parameter(Mandatory=$True)][string]$ldapMapName,
        [Parameter(Mandatory=$True)][string]$deleteBranchID,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #execute pacli with parameters
        $Return = Invoke-PACLICommand $pacli LDAPBRANCHDELETE "$(
            $PSBoundParameters.getEnumerator() | 
                ConvertTo-ParameterString -donotQuote deleteBranchID) OUTPUT (ALL,ENCLOSE)"
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr
            $FALSE

        }
        
        else{
        
            #if result(s) returned
            if($Return.StdOut){
                
                #Convert Output to array
                $Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

                #loop through results
                For($i=0 ; $i -lt $Results.length ; $i+=7){
                    
                    #Get Range from array
                    $values = $Results[$i..($i+7)]
                    
                    #Output Object
                    [PSCustomObject] @{

                        "LDAPBranchID"=$values[0]
                        "LDAPMapID"=$values[1]
                        "LDAPMapName"=$values[2]
                        "LDAPDirName"=$values[3]
                        "LDAPBranchName"=$values[4]
                        "LDAPQuery"=$values[5]
                        "LDAPGroupMatch"=$values[6]

                    }
                        
                }
            
            }
            
        }
        
    }
    
}