Function Set-Password{

    <#
    .SYNOPSIS
    	Enables you to change your CyberArk User password.

    .DESCRIPTION
    	Exposes the PACLI Function: "SETPASSWORD"

    .PARAMETER vault
        The name of the Vault to which the User has access
        
    .PARAMETER user
        The Username of the User who is logged on
        
    .PARAMETER password
        The User’s current password.
        
    .PARAMETER newPassword
        The User’s new password.
        
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
        [Parameter(Mandatory=$True)][string]$password,
        [Parameter(Mandatory=$True)][string]$newPassword,
        [Parameter(Mandatory=$False)][int]$sessionID
    )
    
    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
    
        $Return = Invoke-PACLICommand $pacli SETPASSWORD $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr
            $FALSE

        }
        
        else{
        
            $TRUE
            
        }
        
    }

}