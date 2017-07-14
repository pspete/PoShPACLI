Function Start-PACLI{

    <#
    .SYNOPSIS
    	Starts the PACLI executable. This command must be run before any other 
        commands.

    .DESCRIPTION
    	Exposes the PACLI Function: "INIT"

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .PARAMETER  ctlFileName
        The full path of the file that contains the Certificate Trust List (CTL).
    
    .EXAMPLE
    	Start-PACLI -sessionID $PID
        
        Starts the PACLI process with a session ID equal to the process ID of the current
        Powershell process.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: January 2015
    #>
        
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$False)][int]$sessionID,
        [Parameter(Mandatory=$False)][string]$ctlFileName
    )
    
    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path

        Write-Verbose "Starting Pacli"
    
        $init = (Invoke-Expression "$pacli INIT $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)" -ErrorAction Stop) 2>&1
        
        if($LASTEXITCODE){
            
            Write-Debug $init
            Write-Debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "Error Starting Pacli"
            
            #Return FALSE
            $false
            
        }
        
        Else{
            
            Write-Debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "Pacli Started"
            
            #return TRUE
            $true
            
        }
        
    }

}