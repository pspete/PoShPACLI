Function Get-SafeDetails{

    <#
    .SYNOPSIS
    	Lists Safe details
        
    .DESCRIPTION
    	Exposes the PACLI Function: "SAFEDETAILS"

    .PARAMETER vault
        The name of the Vault to which the Safe Owner has access.
        
    .PARAMETER user
        The Username of the User carrying out the task
        
    .PARAMETER safe
        The name of the Safe whose details will be listed.
        
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
        [Parameter(Mandatory=$True)][String]$safe,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        #define hash to hold values
        $details = @{}
        
        #execute pacli
        $safeDetails = Invoke-Expression "$pacli SAFEDETAILS $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE,OEM)'" | 
            
            #ignore whitespaces, return string
            Select-String -Pattern "\S" | Out-String
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
            If($safeDetails){
            
                Write-Debug $safeDetails
        
                $values = $safeDetails | ConvertFrom-PacliOutput
                
                #Add elements to hashtable
                $details.Add("Description",$values[0])
                $details.Add("Delay",$values[1])
                $details.Add("Retention",$values[2])
                $details.Add("ObjectsRetention",$values[3])
                $details.Add("MaxSize",$values[4])
                $details.Add("CurrSize",$values[5])
                $details.Add("FromHour",$values[6])
                $details.Add("ToHour",$values[7])
                $details.Add("DailyVersions",$values[8])
                $details.Add("MonthlyVersions",$values[9])
                $details.Add("YearlyVersions",$values[10])
                $details.Add("QuotaOwner",$values[11])
                $details.Add("Location",$values[12])
                $details.Add("RequestsRetention",$values[13])
                $details.Add("ConfirmationType",$values[14])
                $details.Add("SecurityLevel",$values[15])
                $details.Add("DefaultAccessMarks",$values[16])
                $details.Add("ReadOnlyByDefault",$values[17])
                $details.Add("UseFileCategories",$values[18])
                $details.Add("VirusFree",$values[19])
                $details.Add("TextOnly",$values[20])
                $details.Add("RequireReason",$values[21])
                $details.Add("EnforceExclusivePasswords",$values[22])
                $details.Add("RequireContentValidation",$values[23])
                $details.Add("ShareOptions",$values[24])
                $details.Add("ConfirmationCount",$values[25])
                $details.Add("MaxFileSize",$values[26])
                $details.Add("AllowedFileTypes",$values[27])
                $details.Add("SupportOLAC",$values[28])

                #return object from hashtable
                New-Object -TypeName psobject -Property $details | select Description, Delay, Retention, ObjectsRetention, 
                    MaxSize, CurrSize, FromHour, ToHour, DailyVersions, MonthlyVersions, YearlyVersions, QuotaOwner,
                        Location, RequestsRetention, ConfirmationType, SecurityLevel, DefaultAccessMarks, ReadOnlyByDefault,
                            UseFileCategories, VirusFree, TextOnly, RequireReason, EnforceExclusivePasswords, 
                                RequireContentValidation, ShareOptions, ConfirmationCount, MaxFileSize, AllowedFileTypes, 
                                    SupportOLAC
            
            }
            
        }
        
    }
            
}