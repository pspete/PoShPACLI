﻿Function Get-UserDetails {

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
		Get-UserDetails -vault Lab -user administrator -destUser zEST1

		Lists properties of vault user zEST1

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$destUser,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#execute pacli with parameters
		$Return = Invoke-PACLICommand $pacli USERDETAILS "$($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 65) {

					#Get Range from array
					$values = $Results[$i..($i + 65)]

					#Output Object
					[PSCustomObject] @{

						#assign values to properties
						"Name"                      = $values[0]
						"Retention"                 = $values[1]
						"UsersAdmin"                = $values[2]
						"SafesAdmin"                = $values[3]
						"NetworksAdmin"             = $values[4]
						"RulesAdmin"                = $values[5]
						"FileCategoriesAdmin"       = $values[6]
						"AuditAdmin"                = $values[7]
						"BackupAdmin"               = $values[8]
						"RestoreAdmin"              = $values[9]
						"Location"                  = $values[10]
						"KeyFileName"               = $values[11]
						"FromHour"                  = $values[12]
						"ToHour"                    = $values[13]
						"FirstName"                 = $values[14]
						"MiddleName"                = $values[15]
						"LastName"                  = $values[16]
						"HomeStreet"                = $values[17]
						"HomeCity"                  = $values[18]
						"HomeState"                 = $values[19]
						"HomeCountry"               = $values[20]
						"HomeZIP"                   = $values[21]
						"WorkPhone"                 = $values[22]
						"HomePhone"                 = $values[23]
						"Cellular"                  = $values[24]
						"Fax"                       = $values[25]
						"Pager"                     = $values[26]
						"HEmail"                    = $values[27]
						"BEmail"                    = $values[28]
						"OEmail"                    = $values[29]
						"JobTitle"                  = $values[30]
						"Organization"              = $values[31]
						"Department"                = $values[32]
						"Profession"                = $values[33]
						"WorkStreet"                = $values[34]
						"WorkCity"                  = $values[35]
						"WorkState"                 = $values[36]
						"WorkCountry"               = $values[37]
						"WorkZip"                   = $values[38]
						"HomePage"                  = $values[39]
						"Notes"                     = $values[40]
						"ExpirationDate"            = $values[41]
						"PassAuth"                  = $values[42]
						"PKIAuth"                   = $values[43]
						"SecureIDAuth"              = $values[44]
						"NTAuth"                    = $values[45]
						"RadiusAuth"                = $values[46]
						"ChangePassword"            = $values[47]
						"PasswordNeverExpires"      = $values[48]
						"LDAPUser"                  = $values[49]
						"Template"                  = $values[50]
						"GWAccount"                 = $values[51]
						"Disabled"                  = $values[52]
						"Quota"                     = $values[53]
						"UsedQuota"                 = $values[54]
						"DN"                        = $values[55]
						"Fingerprint"               = $values[56]
						"LDAPFullDN"                = $values[57]
						"LDAPDirectory"             = $values[58]
						"MapID"                     = $values[59]
						"MapName"                   = $values[60]
						"UserAuth"                  = $values[61]
						"UserTypeID"                = $values[62]
						"NonAllowedClients"         = $values[63]
						"EnableComponentMonitoring" = $values[64]

					}

				}

			}

		}

	}

}