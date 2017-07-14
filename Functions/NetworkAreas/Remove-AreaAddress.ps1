Function Remove-AreaAddress{

    <#
    .SYNOPSIS
    	Deletes an IP address from an existing Network Area.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEAREAADDRESS"

    .PARAMETER vault
        The name of the Vault in which the Network Area is defined.
        
    .PARAMETER user
        The name of the User carrying out the task.

    .PARAMETER networkArea
        The name of the Network Area from which to delete an IP address
        
    .PARAMETER ipAddress
        The IP address to delete from the Network Area.
        
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
        [Parameter(Mandatory=$True)][string]$networkArea,
        [Parameter(Mandatory=$True)][string]$ipAddress,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $removeAreaAddress = Invoke-Expression "$pacli DELETEAREAADDRESS $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
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