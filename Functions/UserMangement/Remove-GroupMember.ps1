Function Remove-GroupMember{

    <#
    .SYNOPSIS
    	Removes a User as a member from a CyberArk group.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEGROUPMEMBER"

    .PARAMETER vault
		The name of the Vault containing the group.

    .PARAMETER user
		The Username of the User who is carrying out the command

    .PARAMETER group
		The name of the group.
    
    .PARAMETER member
        The name of the group member to delete
        
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
        [Parameter(Mandatory=$True)][string]$group,
        [Parameter(Mandatory=$True)][string]$member,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                
        $removeGroupMember = Invoke-Expression "$pacli REMOVEGROUPMEMBER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $false
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $true
            
        }
        
    }

}