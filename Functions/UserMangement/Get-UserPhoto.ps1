Function Get-UserPhoto{

    <#
    .SYNOPSIS
    	Retrieves the photograph of the specified CyberArk User from the Vault

    .DESCRIPTION
    	Exposes the PACLI Function: "GETUSERPHOTO"
    
    .PARAMETER vault 
    	The name of the Vault to which the User has access.
        
    .PARAMETER user 
    	The Username of the User who is carrying out the command.
        
    .PARAMETER destUser 
    	The name of the User whose photo you wish to retrieve.
        
    .PARAMETER localFolder 
    	The path of the folder in which the photograph is stored

    .PARAMETER localFile 
    	The name of the file in which the photograph is stored
        
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
        [Parameter(Mandatory=$True)][string]$destUser,
        [Parameter(Mandatory=$True)][string]$localFolder,
        [Parameter(Mandatory=$True)][string]$localFile,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
        
        $getUserPhoto = Invoke-Expression "$pacli GETUSERPHOTO $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $false
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $true
            
        }
        
    }

}