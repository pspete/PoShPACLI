Function Add-File{

    <#
    .SYNOPSIS
    	Stores a file, that is currently on your local computer, in a secure 
        location in a Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "STOREFILE"

    .PARAMETER vault
        The name of the Vault to which the User has access.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe where the file will be stored.

    .PARAMETER folder
        The folder in the Safe where the file will be stored.

    .PARAMETER file
        The name of the file as it will be stored in the Safe.

    .PARAMETER localFolder
        The location on the User's terminal where the file is currently
        located.

    .PARAMETER localFile
        The name of the file to be stored in the Vault as it is on the User’s
        terminal.

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
        [Parameter(Mandatory=$True)][string]$file,
        [Parameter(Mandatory=$True)][string]$localFolder,
        [Parameter(Mandatory=$True)][string]$localFile,
        [Parameter(Mandatory=$False)][switch]$deleteMacros,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $removeFile = (Invoke-Expression "$pacli STOREFILE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1
        
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