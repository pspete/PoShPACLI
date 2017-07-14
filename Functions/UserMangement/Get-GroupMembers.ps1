Function Get-GroupMembers{

    <#
    .SYNOPSIS
    	Lists the members of a specified CyberArk group

    .DESCRIPTION
    	Exposes the PACLI Function: "GROUPMEMBERS"

    .PARAMETER vault
       The name of the Vault in which the group is defined.
    
    .PARAMETER user
        The Username of the User who is carrying out the command.

    .PARAMETER group
        The name of the group
        
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
        [Parameter(Mandatory=$True)][string]$group,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #execute pacli with parameters
        $groupMembers = (Invoke-Expression "$pacli GROUPMEMBERS $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($groupMembers){
                
                #process each result
                foreach($member in $groupMembers){
                    
                    #define hash to hold values
                    $groupMember = @{}
                    
                    #split the command output
                    $values = $member | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $groupMember.Add("Name",$values[0])
                    $groupMember.Add("UserID",$values[1])
                    
                    #output object
                    new-object -Type psobject -Property $groupMember | select Name, UserID
                        
                }
            
            }
            
        }
        
    }
    
}