Function Remove-Location{

    <#
    .SYNOPSIS
    	Deletes a Location

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETELOCATION"

    .PARAMETER vault
        The name of the Vault to which the User has access.
    
    .PARAMETER user
        The Username of the User who is carrying out the command.
        
    .PARAMETER location
        The name of the location to delete.
        Note: Add a backslash ‘\’ before the name of the location
        
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
        [Parameter(Mandatory=$True)][string]$location,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                
        $Return = Invoke-PACLICommand $pacli DELETELOCATION $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr
            $FALSE

        }
        
        else{
        
            $TRUE
            
        }
        
    }

}