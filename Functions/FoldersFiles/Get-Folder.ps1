Function Get-Folder{

    <#
    .SYNOPSIS
    	Lists folders in the specified Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "FOLDERSLIST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe whose folders will be listed.

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
        [Parameter(Mandatory=$True)][string]$safe,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #execute pacli
        $Return = Invoke-PACLICommand $pacli FOLDERSLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr

        }
        
        else{
        
            #if result(s) returned
            if($Return.StdOut){
                
                #Convert Output to array
                $Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)
                
                #loop through results
                For($i=0 ; $i -lt $Results.length ; $i+=5){
                    
                    #Get Range from array
                    $values = $Results[$i..($i+5)]
                    
                    #Output Object
                    [PSCustomObject] @{

                        "Name"=$values[0]
                        "Accessed"=$values[1]
                        "History"=$values[2]
                        "DeletionDate"=$values[3]
                        "DeletedBy"=$values[4]
                    
                    }
                        
                }
            
            }
            
        }
        
    }
    
}