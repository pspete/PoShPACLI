Function Get-TrustedNetworkArea{

    <#
    .SYNOPSIS
    	Lists Trusted Network Areas

    .DESCRIPTION
    	Exposes the PACLI Function: "TRUSTEDNETWORKAREALIST"

    .PARAMETER vault 
	   The name of the Vault in which the Trusted Network Area is defined.
       
    .PARAMETER user 
	   The name of the User carrying out the task.
    
    .PARAMETER trusterName 
	   The User who has access to the Trusted Network Area
    
    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True)][string]$vault,
        [Parameter(Mandatory=$True)][string]$user,
        [Parameter(Mandatory=$True)][string]$trusterName,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        #execute pacli with parameters
        $Return = Invoke-PACLICommand $pacli TRUSTEDNETWORKAREASLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr

        }
        
        else{
        
            #if result(s) returned
            if($Return.StdOut){
                
                #Convert Output to array
                $Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)
                
                #loop through results
                For($i=0 ; $i -lt $Results.length ; $i+=6){
                    
                    #Get Range from array
                    $values = $Results[$i..($i+6)]
                    
                    #Output Object
                    [PSCustomObject] @{

                        "Name"=$values[0]
                        "FromHour"=$values[1]
                        "ToHour"=$values[2]
                        "Active"=$values[3]
                        "MaxViolationCount"=$values[4]
                        "ViolationCount"=$values[5]

                    }
                       
                }
            
            }
            
        }
        
    }
    
}