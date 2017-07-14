Function Initialize-PoShPACLI{

    <#
    .SYNOPSIS
    	Sets required variables needed to run Module/PACLI Functions.

    .DESCRIPTION
    	Finds, in the local environment PATH, or sets the path to the PACLI utility
        using a folder location provided as a parameter to the function.
        A variable called $pacli is set in the parent scope and is used by other functions in the module
        to locate the PACLI executable. 

    .PARAMETER pacliFolder
        If PACLI is does not reside in a folder in the local PATH Enviromental variable,
        supply the folder in which to find the PACLI executable against this parameter.
    
    .PARAMETER pacliExe
        Supply the name of the PACLI executable if it is different to "PACLI.EXE"
        
    .PARAMETER scope
        The scope in which to set the variables required for the module functions to run.
        By default this is set to "1" (the parent scope).
    
    .EXAMPLE
        Initialize-PoShPACLI
        
    .EXAMPLE
        Initialize-PoShPACLI -pacliFolder C:\Software\Pacli\
        
    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: January 2015
    #>
        
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$False)][ValidateScript({Test-Path $_ -PathType container})][string]$pacliFolder,
        [Parameter(Mandatory=$False)][string]$pacliExe = "PACLI.EXE",
        [Parameter(Mandatory=$False)][ValidateSet("Global","Local","Script","Private",0,1,2,3)][string]$scope = 1
    )
    
    #Force remove pacli variable in specifed scope
    Remove-Variable -scope $scope -name pacli -Force -ErrorAction SilentlyContinue
    
    Try{
    
        #if no folder path has been supplied to function
        if($PSBoundParameters.keys -notcontains "pacliFolder"){
            
            #look for PACLI in the PATH environmental variable
            $pacliPath = (Get-Command -Name $pacliExe -CommandType Application -ErrorAction Stop | 

                Select -ExpandProperty Definition) | select -First 1

        }
        
        Else{
            
            If(!(Test-Path ($pacliPath = Join-Path -path $pacliFolder -childPath $pacliExe) -pathType Leaf -include $pacliExe -ErrorAction Stop)){

                #not valid/pacli.exe not found in folder
                throw
    
            }
        
        }
        
    }
    
    Catch{
    
        #pacli not found
        Remove-Variable -name pacliPath -ErrorAction SilentlyContinue
        Write-Error "PACLI Utility not found: Provide a valid folder location for the utility"
        
    }
    
    Finally{
    
        If(!(get-variable -name pacliPath -ErrorAction SilentlyContinue)){
        
            #pacli not found/path not set
            
        }
        
        Else{
        
            Set-Variable -Scope $scope -name pacli -Value $pacliPath -Force -PassThru -ErrorAction Stop
        
        }
    
    }
    
}