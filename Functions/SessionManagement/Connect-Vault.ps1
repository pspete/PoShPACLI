Function Connect-Vault{

    <#
    .SYNOPSIS
    	This command enables you to log onto the Vault.

    .DESCRIPTION
        Exposes the PACLI Function: "LOGON"
    	Either log onto the Vault with this function by specifying a username and  
        password or by using an authentication parameter file. To create this file, 
        see the New-LogonFile command.

    .PARAMETER vault
        The name of the Vault to log onto
        
    .PARAMETER user
        The Username of the User logging on
        
    .PARAMETER password
        The User’s password.
        Note: The LOGONFILE and PASSWORD parameters cannot be defined together.

    .PARAMETER newPassword
        The User’s new password (if the User would like to change password at 
        logon time) or NULL.
        Note: The LOGONFILE and NEWPASSWORD parameters cannot be defined together.

    .PARAMETER logonFile
        The full pathname of the logon parameter file which contains the User’s 
        name and scrambled password.
        Note: The logonfile parameter cannot be defined with the RADIUS, PASSWORD, 
        or NEWPASSWORD parameters.

    .PARAMETER autoChangePassword
        Determines whether or not the password is automatically changed each time 
        the User logs onto the Vault. 
        It is only relevant when you use the LogonFile parameter of the 
        CreateLogonFile command. 
        It will generate a randomized new password, change to the new password on 
        logon, and will save it to the  authentication file after a successful logon.
        
    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .PARAMETER failIfConnected
        Whether or not to disconnect the session if the user is already logged onto 
        the Vault through a different interface

    .PARAMETER radius
        Whether or not to enable Radius authentication to the Vault.
        Notes:
            PACLI does not support challenge response for RADIUS authentication.
            The logonfile and radius parameters cannot be defined in the same command.

    .EXAMPLE
    	Connect-Vault -vault Vault -user User -password pa55w0RD

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>
        
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True)][string]$vault,
        [Parameter(Mandatory=$True)][string]$user,
        [Parameter(Mandatory=$False)][string]$password,
        [Parameter(Mandatory=$False)][string]$newPassword,
        [Parameter(Mandatory=$False)][string]$logonFile,
        [Parameter(Mandatory=$False)][switch]$autoChangePassword,
        [Parameter(Mandatory=$False)][int]$sessionID,
        [Parameter(Mandatory=$False)][switch]$failIfConnected,
        [Parameter(Mandatory=$False)][switch]$radius
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
            
        Write-Verbose "Logging onto Vault"
        
        $Return = Invoke-PACLICommand $pacli LOGON $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr
            Write-Verbose "Error Logging on"
            $FALSE

        }
        
        else{
        
            Write-Verbose "Succesfully Logged on"
            $TRUE
            
        }
        
    }

}