Function Add-ExternalUser{

    <#
    .SYNOPSIS
    	Adds a new user from an external directory

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDUPDATEEXTERNALUSERENTITY"

    .PARAMETER sessionID
    	

    .PARAMETER vault
    	The name of the Vault where the file is stored.

    .PARAMETER user
    	The Username of the User who is carrying out the task.

    .PARAMETER destUser
    	The name (samaccountname) of the external User or Group that will be created 
        in the Vault.

    .PARAMETER ldapFullDN
    	The full DN of the user in the external directory.

    .PARAMETER ldapDirectory
    	The name (netbios domain name) of the external directory where the user or 
        group is defined.

    .PARAMETER UpdateIfExists
    	Whether or not existing external Users and Groups definitions will be updated 
        in the Vault.
                    
    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: January 2015
        Work required to support LDAPFullDN & Parameter Validation / Parameter Sets
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string]$vault,
        [Parameter(Mandatory=$True)]
        [string]$user,
        [Parameter(Mandatory=$True)]
        [string]$destUser,
        [Parameter(Mandatory=$False)]
        [string]$ldapFullDN,
        [Parameter(Mandatory=$True)]
        [string]$ldapDirectory,
        [Parameter(Mandatory=$False)]
        [switch]$UpdateIfExists,
        [Parameter(Mandatory=$False)]
        [int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
        
        $addUser = (Invoke-Expression "$pacli ADDUPDATEEXTERNALUSERENTITY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) Output '(ALL,ENCLOSE)'" -ErrorAction SilentlyContinue) 2>&1
        
        if($LASTEXITCODE){
            
            write-debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "Error Adding External User: $destUser"
            write-debug $($addUser[0]|Out-String)   
            
        }
        
        Else{
            
            write-debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "External User $destUser added."
            $addUser | ConvertFrom-PacliOutput
            
        }
        
    }
    
}