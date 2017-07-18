Function Get-SafeEvents{

    <#
    .SYNOPSIS
    	Lists Safe Events that are written in the current Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "SAFEEVENTSLIST"

    .PARAMETER vault
        The name of the Vault that contains the Events.
    
    .PARAMETER user
        The name of the User who is carrying out the task.
    
    .PARAMETER safePatternName
        A Safe name pattern to include in the returned Events list.
    
    .PARAMETER sourceIDList
        A specific source ID for filtering the Events list. If this parameter
        is not specified, all the SourceId’s will be included in the
        returned Events list.
        Note: This parameter has been deprecated.
    
    .PARAMETER eventTypeIDList
        An Event type ID for filtering the Events list. If this parameter is
        not specified, all the EventTypeId’s will be included in the
        returned Events list.
    
    .PARAMETER fromDate
        The first date to include in the returned Events list.
    
    .PARAMETER dataSubstring
        The string that is included in the Data field of the Event that will
        be included in the returned Events list.
    
    .PARAMETER numOfEvents
        The number of recent Events to include in the returned Events list.
    
    .PARAMETER caseSensitive
        Whether or not the filter according to the ‘datasubstring’
        parameter will be case-sensitive.
    
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
        [Parameter(Mandatory=$False)][string]$safePatternName,
        [Parameter(Mandatory=$False)][string]$sourceIDList,
        [Parameter(Mandatory=$False)][string]$eventTypeIDList,
        [Parameter(Mandatory=$False)]
            [ValidateScript({($_ -eq (get-date $_ -f dd/MM/yyyy))})]
                [string]$fromDate,
        [Parameter(Mandatory=$False)][string]$dataSubstring,
        [Parameter(Mandatory=$False)][int]$numOfEvents,
        [Parameter(Mandatory=$False)][switch]$caseSensitive,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #execute pacli    
        $Return = Invoke-PACLICommand $pacli SAFEEVENTSLIST "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"
        
        if($Return.ExitCode){
            
            Write-Debug $Return.StdErr

        }
        
        else{
        
            #if result(s) returned
            if($Return.StdOut){
                
                #Convert Output to array
                $Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)
                
                #loop through results
                For($i=0 ; $i -lt $Results.length ; $i+=15){
                    
                    #Get Range from array
                    $values = $Results[$i..($i+15)]
                    
                    #Output Object
                    [PSCustomObject] @{

                        "SafeName"=$values[0]
                        "SafeID"=$values[1]
                        "EventID"=$values[2]
                        "SourceID"=$values[3]
                        "EventTypeID"=$values[4]
                        "CreationDate"=$values[5]
                        "ExpirationDate"=$values[6]
                        "UserName"=$values[7]
                        "UserID"=$values[8]
                        "AgentName"=$values[9]
                        "AgentID"=$values[10]
                        "ClientID"=$values[11]
                        "Version"=$values[12]
                        "FromIP"=$values[13]
                        "Data"=$values[14]
                    
                    }
                        
                }
            
            }
            
        }
        
    }
    
}