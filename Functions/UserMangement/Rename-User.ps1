Function Rename-User{

    <#
    .SYNOPSIS
    	Renames a CyberArk User

    .DESCRIPTION
    	Exposes the PACLI Function: "RENAMEUSER"

    .PARAMETER vault
        The name of the Vault.

    .PARAMETER user
        The Username of the User who is logged on.

    .PARAMETER destUser
        The current name of the User to rename.

    .PARAMETER newName
        The new name of the User.

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
        [Parameter(Mandatory=$True)][string]$newName,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
        
        $renameUser = Invoke-Expression "$pacli RENAMEUSER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
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