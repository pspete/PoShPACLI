Function Set-UserPhoto{

    <#
    .SYNOPSIS
    	Saves a User’s photo in the Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "PUTUSERPHOTO"
    
    .PARAMETER vault 
    	The name of the Vault to which the User has access.
        
    .PARAMETER user 
    	The Username of the User who is carrying out the command.
        
    .PARAMETER destUser 
    	The name of the User in the photograph.
        
    .PARAMETER localFolder 
    	The location of the folder in which the photograph is stored

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
        
        $setUserPhoto = Invoke-Expression "$pacli PUTUSERPHOTO $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
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