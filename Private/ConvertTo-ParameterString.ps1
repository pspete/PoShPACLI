Function ConvertTo-ParameterString{

    <#
    .SYNOPSIS
    	Converts bound parameters from called functions to a quoted string formatted
        to be supplied to the PACLI command line tool

    .DESCRIPTION
    	Allows values supplied against PowerShell function parameters to be easily
        translated into a specifically formatted string to be used to supply 
        arguments to native PACLI functions.
        
        Common Parameters, like Verbose or Debug, which may be contained in the array
        passed to this function are exluded from the output by default as they will 
        not be interpreted by the PACLI utility and will result in an error.

    .PARAMETER boundParameters
    	The bound parameter object from a PowerShell function.
        
    .PARAMETER quoteOutput
    	Specifies whether arguments and values contained in output string should be quoted

    .PARAMETER excludedParameters
        Array of parameters, of which the names and values should not be included in the 
        output string.
        
        By default this contains all PowerShell Common Parameter Names:
            Debug
            ErrorAction
            ErrorVariable
            OutVariable
            OutBuffer
            PipelineVariable
            Verbose
            WarningAction
            WarningVariable
            WhatIf
            Confirm
    
        Common Parameters may be contained in the array passed to this function, and must 
        be excluded from the output as they will not be interpreted by the PACLI utility 
        and will therefore result in an error.
        
    .EXAMPLE
    	$PSBoundParameters.getEnumerator() | ConvertTo-ParameterString
        
        Outputs a string where the Key/Value pairs contained in PSBoundParameters are converted into KEY=VALUE

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: January 2015
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True,ValueFromPipeline=$True)][array]$boundParameters,
        [Parameter(Mandatory=$False,ValueFromPipeline=$False)][switch]$quoteOutput,
        [Parameter(Mandatory=$False,ValueFromPipeline=$False)][array]$excludedParameters = @(
            "Debug","ErrorAction","ErrorVariable","OutVariable","OutBuffer","PipelineVariable",
                "Verbose","WarningAction","WarningVariable","WhatIf","Confirm")
    )

    Begin{
    
        write-debug "Processing Bound Parameters"
        #define array to hold parameters
        $parameters=@()
        
    }
    
    Process{
        
        #foreach elemant in passed array
        $boundParameters | foreach{
        
            If($excludedParameters -notContains $_.key){
                    
                #add key=value to array, process switch values to equate TRUE=Yes, FALSE=No
                $parameters+=$($_.Key)+"="+(($($_.Value) -replace "True", "YES") -replace "False", "NO")
            
            }
                
        }    
        
    }
    
    End{
        
        if($parameters){

            $parameters = $parameters -join ' '
                        
            If($quoteOutput){
            
                #Add required quotes at whitespaces, at thh start and end of string and around '=' symbol
                $parameters = ((($parameters -replace "(\s)",'""" "') -replace "(^)|($)",'"') -replace "(=)",'=""')
            
            }
                
            write-debug $parameters
            #output parameter string
            $parameters

        }
        
    }

}