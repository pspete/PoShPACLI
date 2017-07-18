Function Get-SafeActivity{

    <#
    .SYNOPSIS
    	Produces a list of activities of all the Safe Owners of the specified
        Safe(s).

    .DESCRIPTION
    	Exposes the PACLI Function: "INSPECTSAFE"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.
        
    .PARAMETER user
        The Username of the User carrying out the task.
        
    .PARAMETER safePattern
        The full name or part of the name of the Safe(s) to include in the report. 
        Alternatively, a wildcard can be used in this parameter.
        The default is ‘*’ (wildcard).
        
    .PARAMETER userPattern
        The full name or part of the name of the Owner(s) to include in the list. 
        Alternatively, a wildcard can be used in this parameter.
        
    .PARAMETER logdays
        The number of days to include in the list of activities.
        The default is ‘-1’, meaning that all the days registered in the log will be included.

    .PARAMETER alertsOnly
        Whether or not the activities list will contain only alerts or every activity.
        The default is ‘NO’.

    .PARAMETER fileName
        The full path name of the file where the log records will be saved.

    .PARAMETER codes
        The message codes that will be used to filter the log activities. 
        Multiple codes are separated by commas.

    .PARAMETER fromDate
        The first day to be included in the list of activities. 
        Use the following date format: dd/mm/yyyy.

    .PARAMETER toDate
        The last day to be included in the list of activities. 
        Use the following date format: dd/mm/yyyy.

    .PARAMETER requestID
        The unique ID of a request in the list of activities.

    .PARAMETER categoriesNames
        The name of the categories to include in the list. 
        
        Separate multiple category names with the value of the 
        CATEGORIESSEPERATOR parameter. 
        
        Specify a corresponding value for each category name in the 
        CATEGORIESVALUE parameter.

    .PARAMETER categoriesValues
        The value of each category specified in the CATEGORIESNAMES parameter. 
        
        Separate multiple category names with the value of the 
        CATEGORIESSEPERATOR parameter. 
        
        Specify a corresponding value for each category in the 
        CATEGORIESNAME parameter.

    .PARAMETER categoriesSeperator
        The separator between multiple category names and multiple category values.
        The default is ‘,’ (comma).

    .PARAMETER categoryFilterType
        The type of category filter. Possible values are:
            AND – Categories will be filtered according to all the 
                specified filters.
            OR – Categories will be filtered according to one of the 
                specified categories.
                The default is ‘AND’.

    .PARAMETER maxRecords
        The maximum number of records to retrieve.

    .PARAMETER userType
        The user type to use to filter activities.

    .PARAMETER options
        The INSPECTSAFE options. 
        Possible values are:
            1 – Returns the results in descending order.
            2 – Indicates the user pattern is in regular expression.
            4 – Uses negation for user pattern regular expression.
            16 – Displays only an external audit.
            32 – Displays only an internal audit.
            64 – Sort according to external time.
            128 – The user pattern is the exact string, not a wildcard 
                or regular expression.
            256 – Shows system audit.

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
        [Parameter(Mandatory=$True)][string]$safePattern,
        [Parameter(Mandatory=$True)][string]$userPattern,
        [Parameter(Mandatory=$False)][int]$logdays,
        [Parameter(Mandatory=$False)][switch]$alertsOnly,
        [Parameter(Mandatory=$False)][string]$fileName,
        [Parameter(Mandatory=$False)][string]$codes,
        [Parameter(Mandatory=$False)]
            [ValidateScript({($_ -eq (get-date $_ -f dd/MM/yyyy))})]
                [string]$fromDate,
        [Parameter(Mandatory=$False)]
            [ValidateScript({($_ -eq (get-date $_ -f dd/MM/yyyy))})]
                [string]$toDate,
        [Parameter(Mandatory=$False)][string]$requestID,
        [Parameter(Mandatory=$False)][string]$categoriesNames,
        [Parameter(Mandatory=$False)][string]$categoriesValues,
        [Parameter(Mandatory=$False)][string]$categoriesSeperator,
        [Parameter(Mandatory=$False)][ValidateSet("OR","AND")][string]$categoryFilterType,
        [Parameter(Mandatory=$False)][int]$maxRecords,
        [Parameter(Mandatory=$False)][string]$userType,
        [Parameter(Mandatory=$False)][ValidateSet("1","2","4","16","32","64","128","256")][int]$options,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #execute pacli    
        $Return = Invoke-PACLICommand $pacli INSPECTSAFE "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr

        }
        
        else{
        
            #if result(s) returned
            if($Return.StdOut){
                
                #Convert Output to array
                $Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)
                
                #loop through results
                For($i=0 ; $i -lt $Results.length ; $i+=9){
                    
                    #Get Range from array
                    $values = $Results[$i..($i+9)]
                    
                    #Output Object
                    [PSCustomObject] @{

                        "Time"=$values[0]
                        "User"=$values[1]
                        "Safe"=$values[2]
                        "Activity"=$values[3]
                        "Location"=$values[4]
                        "NewLocation"=$values[5]
                        "RequestID"=$values[6]
                        "RequestReason"=$values[7]
                        "Code"=$values[8]
                    
                    }

                }
            
            }
            
        }
        
    }
    
}