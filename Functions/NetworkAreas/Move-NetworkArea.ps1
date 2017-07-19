Function Move-NetworkArea{

    <#
    .SYNOPSIS
    	Moves a Network Area to a new location in the Network Areas tree.

    .DESCRIPTION
    	Exposes the PACLI Function: "MOVENETWORKAREA"

    .PARAMETER vault
        The name of the Vault to which the Network Area will be added.
        
    .PARAMETER user
        The name of the User carrying out the task.
        
    .PARAMETER networkArea
        The name of the Network Area.
        
    .PARAMETER newLocation
        The new location of the Network Area.
        Note: Add a backslash ‘\’ before the name of the location.

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
        [Parameter(Mandatory=$True)][string]$networkArea,
        [Parameter(Mandatory=$True)][string]$newLocation,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $Return = Invoke-PACLICommand $pacli MOVENETWORKAREA $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr
            $FALSE

        }
        
        else{
        
            $TRUE
            
        }
        
    }

}