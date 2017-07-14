Function Get-RulesList{

    <#
    .SYNOPSIS
    	Lists all the service rules in a specified Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "RULESLIST"

    .PARAMETER vault
        The name of the Vault.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER safeName
        The Safe where the ruls are applied.

    .PARAMETER fullObjectName
        The file, password, or folder that the rule applies to.
        
    .PARAMETER isFolder
        Whether the rule applies to files and passwords or for folders.
            NO – Indicates files and passwords
            YES – Indicates folders
            
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
        [Parameter(Mandatory=$True)][string]$safeName,
        [Parameter(Mandatory=$True)][string]$fullObjectname,
        [Parameter(Mandatory=$False)][switch]$isFolder,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #define hash to hold values
        $details = @{}
        
        $rulesList = Invoke-Expression "$pacli RULESLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
            
            #ignore whitespaces, return string
            Select-String -Pattern "\S" | Out-String
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $false
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
            if($rulesList){
            
                ForEach($rule in $rulesList){
                
                    $values = $rule | ConvertFrom-PacliOutput

                    #Add elements to hashtable
                    $details.Add("RuleID",$values[0])
                    $details.Add("UserName",$values[1])
                    $details.Add("SafeName",$values[2])
                    $details.Add("FullObjectName",$values[3])
                    $details.Add("Effect",$values[4])
                    $details.Add("RuleCreationDate",$values[5])
                    $details.Add("AccessLevel",$values[6])                    
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $details | select RuleID, UserName, SafeName, FullObjectName, Effect, RuleCreationDate, AccessLevel
                
                }
                
            }
            
        }
        
    }

}