Function Move-Folder{

    <#
    .SYNOPSIS
    	Moves a folder to a different location within the same Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "MOVEFOLDER"

    .PARAMETER vault
        The name of the Vault in which the folder is located.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe containing the folder to move.

    .PARAMETER folder
        The name of the folder.

    .PARAMETER newLocation
        The new location of the folder.
        Note: Add a backslash ‘\’ before the name of the location.
        
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
        [Parameter(Mandatory=$True)][string]$safe,
        [Parameter(Mandatory=$True)][string]$folder,
        [Parameter(Mandatory=$True)][string]$newLocation,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $moveFolder = (Invoke-Expression "$pacli MOVEFOLDER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1
        
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