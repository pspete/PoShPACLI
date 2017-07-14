Function Get-HttpGwUrl{

    <#
    .SYNOPSIS
    	Retrieves the HTTP Gateway URL for a file in the Safe. 
        Note: This command is no longer supported in version 5.5.

    .DESCRIPTION
    	Exposes the PACLI Function: "GETHTTPGWURL"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The name of the user carrying out the task.

    .PARAMETER safe
        The name of the Safe that contains the file.

    .PARAMETER folder
        The name of the folder where the file is stored.

    .PARAMETER file
        The name of the specified file.
        
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
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #execute pacli    
        $httpGwUrl = Invoke-Expression "$pacli GETHTTPGWURL $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'" | 
        
            #ignore whitespace
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($httpGwUrl){
            
                ForEach($gwURL in $httpGwUrl){
        
                    #define hash to hold values
                    $urls = @{}
                    
                    $values = $gwURL | ConvertFrom-PacliOutput
                    
                    #Add elements to hashtable
                    $urls.Add("URL",$values[0])
                    
                    #return object from hashtable
                    New-Object -TypeName psobject -Property $urls | select URL
                        
                }
            
            }
            
        }
        
    }
    
}