Function Get-CtlFileName{

    <#
    .SYNOPSIS
    	Returns the name of the Certificate Trust List (CTL) that was defined 
        during the Start-Pacli function.

    .DESCRIPTION
    	Exposes the PACLI Function: "CTLGETFILENAME"

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
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $ctlFileName = Invoke-Expression "$pacli CTLGETFILENAME $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
            
            #ignore whitespaces, return string
            Select-String -Pattern "\S" | Out-String
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
            if($ctlFileName){
            
                ForEach($fileName in $ctlFileName){
                
                    $values = $fileName | ConvertFrom-PacliOutput

                    #define hash to hold values
                    $details = @{}
            
                    #Add elements to hashtable
                    $details.Add("Name",$values[0])
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $details | select Name
                
                }
                
            }
            
        }
        
    }

}