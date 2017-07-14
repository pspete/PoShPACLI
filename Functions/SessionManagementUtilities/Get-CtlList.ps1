Function Get-CtlList{

    <#
    .SYNOPSIS
    	Lists all the certificates in the Certificate Trust List store.

    .DESCRIPTION
    	Exposes the PACLI Function: "CTLLIST"

    .PARAMETER ctlFileName
    	The name of the CTL file that contains the certificates to list. If this
        parameter is not supplied, the CTL file name that was supplied in
        the INIT function is used.

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
        [Parameter(Mandatory=$False)][string]$ctlFileName,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $ctlList = Invoke-Expression "$pacli CTLLIST $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
            
            #ignore whitespaces, return string
            Select-String -Pattern "\S" | Out-String
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            
            if($ctlList){
            
                ForEach($ctl in $ctlList){
                
                    $values = $ctl | ConvertFrom-PacliOutput

                    #define hash to hold values
                    $details = @{}
            
                    #Add elements to hashtable
                    $details.Add("Subject",$values[0])
                    $details.Add("Issuer",$values[0])
                    $details.Add("FromDate",$values[0])
                    $details.Add("ToDate",$values[0])
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $details | select Subject, Issuer, FromDate, ToDate
                
                }
                
            }
            
        }
        
    }

}