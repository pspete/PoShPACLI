Function Stop-PACLI{

    <#
    .SYNOPSIS
    	This command terminates PACLI. Always run this at the end of every working
        session.

    .DESCRIPTION
    	Exposes the PACLI Function: "TERM"

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Stop-PACLI
        Ends the PACLI process with a session ID of 0
        
    .EXAMPLE
    	Stop-PACLI -sessionID 7
        Ends the PACLI process with a session ID of 7

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: January 2015
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path

        Write-Verbose "Stopping Pacli"
        
        $term = (Invoke-Expression "$pacli TERM $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)" -ErrorAction SilentlyContinue) 2>&1
        
        if($LASTEXITCODE){
        
            Write-Debug $term
            write-debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "Error Stopping Pacli"
            
            #Return FALSE
            $false
            
        }
        
        Else{
            
            write-debug "LastExitCode: $LASTEXITCODE"
            Write-Verbose "Pacli Stopped"
            
            #return TRUE
            $true
            
        }
        
    }

}