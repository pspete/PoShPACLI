Function Lock-File{

    <#
    .SYNOPSIS
    	Locks a file or password, preventing other Users from retrieving it.

    .DESCRIPTION
    	Exposes the PACLI Function: "LOCKFILE"

    .PARAMETER vault
        The name of the Vault in which the file is stored.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe in which the file is stored.

    .PARAMETER folder
        The name of the folder in which the file is stored.

    .PARAMETER file
        The name of the file or password to lock.

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
        [Parameter(Mandatory=$True)][string]$folder = "Root",
        [Parameter(Mandatory=$True)][string]$file,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $lockFile = (Invoke-Expression "$pacli LOCKFILE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1

        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "Error Locking File: $file"
            Write-Debug $($lockFile|Out-String)
            #error Locking File, return false
            $false
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "$file Locked"
            #File Locked return true
            $true
            
        }
        
    }

}