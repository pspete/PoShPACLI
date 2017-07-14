Function Get-UserDetails{

    <#
    .SYNOPSIS
    	Returns details about a specific CyberArk User.

    .DESCRIPTION
    	Exposes the PACLI Function: "USERDETAILS"
    
    .PARAMETER vault
	   The name of the Vault

    .PARAMETER user
	   The Username of the User who is logged on.

    .PARAMETER destUser
	   The name of the User whose details will be listed.

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
        [Parameter(Mandatory=$True)][string]$destUser,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
            
        #execute pacli with parameters
        $userDetails = (Invoke-Expression "$pacli USERDETAILS $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT '(ALL,ENCLOSE)'") | 
            
            #ignore whitespace lines
            Select-String -Pattern "\S"
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"

            #if result(s) returned
            if($userDetails){
                
                #process each result
                foreach($user in $userDetails){
                    
                    #define hash to hold values
                    $vaultUser = @{}
                    
                    #split the command output
                    $values = $user | ConvertFrom-PacliOutput
                        
                    #assign values to properties
                    $vaultUser.Add("Name",$values[0])
                    $vaultUser.Add("Retention",$values[1])
                    $vaultUser.Add("UsersAdmin",$values[2])
                    $vaultUser.Add("SafesAdmin",$values[3])
                    $vaultUser.Add("NetworksAdmin",$values[4])
                    $vaultUser.Add("RulesAdmin",$values[5])
                    $vaultUser.Add("FileCategoriesAdmin",$values[6])
                    $vaultUser.Add("AuditAdmin",$values[7])
                    $vaultUser.Add("BackupAdmin",$values[8])
                    $vaultUser.Add("RestoreAdmin",$values[9])
                    $vaultUser.Add("Location",$values[10])
                    $vaultUser.Add("KeyFileName",$values[11])
                    $vaultUser.Add("FromHour",$values[12])
                    $vaultUser.Add("ToHour",$values[13])
                    $vaultUser.Add("FirstName",$values[14])
                    $vaultUser.Add("MiddleName",$values[15])
                    $vaultUser.Add("LastName",$values[16])
                    $vaultUser.Add("HomeStreet",$values[17])
                    $vaultUser.Add("HomeCity",$values[18])
                    $vaultUser.Add("HomeState",$values[19])
                    $vaultUser.Add("HomeCountry",$values[20])
                    $vaultUser.Add("HomeZIP",$values[21])
                    $vaultUser.Add("WorkPhone",$values[22])
                    $vaultUser.Add("HomePhone",$values[23])
                    $vaultUser.Add("Cellular",$values[24])
                    $vaultUser.Add("Fax",$values[25])
                    $vaultUser.Add("Pager",$values[26])
                    $vaultUser.Add("HEmail",$values[27])
                    $vaultUser.Add("BEmail",$values[28])
                    $vaultUser.Add("OEmail",$values[29])
                    $vaultUser.Add("JobTitle",$values[30])
                    $vaultUser.Add("Organization",$values[31])
                    $vaultUser.Add("Department",$values[32])
                    $vaultUser.Add("Profession",$values[33])
                    $vaultUser.Add("WorkStreet",$values[34])
                    $vaultUser.Add("WorkCity",$values[35])
                    $vaultUser.Add("WorkState",$values[36])
                    $vaultUser.Add("WorkCountry",$values[37])
                    $vaultUser.Add("WorkZip",$values[38])
                    $vaultUser.Add("HomePage",$values[39])
                    $vaultUser.Add("Notes",$values[40])
                    $vaultUser.Add("ExpirationDate",$values[41])
                    $vaultUser.Add("PassAuth",$values[42])
                    $vaultUser.Add("PKIAuth",$values[43])
                    $vaultUser.Add("SecureIDAuth",$values[44])
                    $vaultUser.Add("NTAuth",$values[45])
                    $vaultUser.Add("RadiusAuth",$values[46])
                    $vaultUser.Add("ChangePassword",$values[47])
                    $vaultUser.Add("PasswordNeverExpires",$values[48])
                    $vaultUser.Add("LDAPUser",$values[49])
                    $vaultUser.Add("Template",$values[50])
                    $vaultUser.Add("GWAccount",$values[51])
                    $vaultUser.Add("Disabled",$values[52])
                    $vaultUser.Add("Quota",$values[53])
                    $vaultUser.Add("UsedQuota",$values[54])
                    $vaultUser.Add("DN",$values[55])
                    $vaultUser.Add("Fingerprint",$values[56])
                    $vaultUser.Add("LDAPFullDN",$values[57])
                    $vaultUser.Add("LDAPDirectory",$values[58])
                    $vaultUser.Add("MapID",$values[59])
                    $vaultUser.Add("MapName",$values[60])
                    $vaultUser.Add("UserAuth",$values[61])
                    $vaultUser.Add("UserTypeID",$values[62])
                    $vaultUser.Add("NonAllowedClients",$values[63])
                    $vaultUser.Add("EnableComponentMonitoring",$values[64])
                    
                    #output object
                    new-object -Type psobject -Property $vaultUser | select Name, Retention, UsersAdmin, 
                        SafesAdmin, NetworksAdmin, RulesAdmin, FileCategoriesAdmin, AuditAdmin, BackupAdmin, RestoreAdmin, 
                            Location, KeyFileName, FromHour, ToHour, FirstName, MiddleName, LastName, HomeStreet, HomeCity, 
                                HomeState, HomeCountry, HomeZIP, WorkPhone, HomePhone, Cellular, Fax, Pager, HEmail, BEmail,
                                    OEmail, JobTitle, Organization, Department, Profession, WorkStreet, WorkCity, WorkState, 
                                        WorkCountry, WorkZip, HomePage, Notes, ExpirationDate, PassAuth, PKIAuth, SecureIDAuth, 
                                            NTAuth, RadiusAuth, ChangePassword, PasswordNeverExpires, LDAPUser, Template, GWAccount, 
                                                Disabled, Quota, UsedQuota, DN, Fingerprint, LDAPFullDN, LDAPDirectory, MapID, MapName, 
                                                    UserAuth, UserTypeID, NonAllowedClients, EnableComponentMonitoring
                
                }
            
            }
            
        }
        
    }
    
}