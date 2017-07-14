Function Confirm-Object{

    <#
    .SYNOPSIS
    	Validates a file in a Safe that requires content validation before
        users can access the objects in it.

    .DESCRIPTION
    	Exposes the PACLI Function: "VALIDATEOBJECT"

    .PARAMETER vault
        The name of the Vault in which the file is stored.

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe in which the file is stored.

    .PARAMETER folder
        The name of the folder in which the file is stored.

    .PARAMETER file
        The name of the file to validate.
        
    .PARAMETER internalName
        The internal name of the file version to validate
        
    .PARAMETER validationAction
        The type of validation action that take place. 
        Possible values are:
            VALID
            INVALID
            PENDING

    .PARAMETER reason
        The reason for validating the file.
    
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
        [Parameter(Mandatory=$True)][string]$object,
        [Parameter(Mandatory=$True)][string]$internalName,
        [Parameter(Mandatory=$True)][ValidateSet("VALID","INVALID","PENDING")][string]$validationAction,
        [Parameter(Mandatory=$True)][string]$reason,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $confirmObject = (Invoke-Expression "$pacli VALIDATEOBJECT $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1
        
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