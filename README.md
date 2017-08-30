# PoShPACLI

## **Powershell PACLI Module for CyberArk EPV**

Exposes the native functions of the CyberArk PACLI command line utility via a PowerShell wrapper for interfacing with CyberArk EPV.

----------

## Latest Updates

- [Pipeline Input](#Pipeline_Support)
- [Custom Formats](#Custom_Formats) for Output

## Getting Started

- Check the [relationship table](#Pacli_to_PoShPACLI) to determine what PoShPACLI function exposes which PACLI command.

### Prerequisites

- The CyberArk PACLI executable must be present on the same computer as the module.

### Install & Use

Save the Module to your powershell modules folder of choice.
Find your local PowerShell module paths with the following command:

```powershell
$env:PSModulePath
```

The name of the folder for the module should be "PoShPACLI".

Import the module:

```powershell
Import-Module PoShPACLI
```

Discover Commands:

```powershell
Get-Command -Module PoShPACLI
```

Function Initialize-PoShPACLI must be run before working with the other module functions:

```powershell
Initialize-PoShPACLI -pacliFolder D:\PACLI
```

This is required to locate the CyberArk PACLI executable in the SYSTEM path, or in a folder you specify, in order for the module to be able to execute the utility.

----------

An identical process to using the PACLI tool on its own should be followed:

Example method to use the module to add a password object to a safe:

#### Connecting to a Vault

```powershell
#Locate/set path to PACLI executable

Initialize-PoShPACLI

#Start PACLI Executable

Start-PVPacli

#Define Vault

New-PVVaultDefinition -vault "VAULT" -address "vaultAddress"

#Logon to vault

Connect-PVVault -vault "VAULT" -user "User" -password (Read-Host -AsSecureString))

```

#### Add Password Object to Safe

```powershell
#Open Safe

Open-PVSafe -vault "VAULT" -user "User" -safe "SAFE_Name"

#Add Password to Safe

Add-PVPasswordObject -vault "VAULT" -user "User" -safe "SAFE_Name" -folder "Root" -file "passwordFile" -password (Read-Host -AsSecureString)

#Add Device Type for password

Add-PVFileCategory -vault "VAULT" -user "User" -safe "SAFE_Name" -folder "Root" -file "passwordFile" -category "DeviceType" -value
"Device_Type"

#Add PolicyID for password

Add-PVFileCategory -vault "VAULT" -user "User" -safe "SAFE_Name" -folder "Root" -file "passwordFile" -category "PolicyID" -value "Policy_Name"

#Add Logon Domain for password

Add-PVFileCategory -vault "VAULT" -user "User" -safe "SAFE_Name" -folder "Root" -file "passwordFile" -category "LogonDomain" -value "Domain_Name"

#Add Address for password

Add-PVFileCategory -vault "VAULT" -user "User" -safe "SAFE_Name" -folder "Root" -file "passwordFile" -category 'Address' -value "Address_Value"

#Add UserName for password

Add-PVFileCategory -vault "VAULT" -user "User" -safe "SAFE_Name" -folder "Root" -file "passwordFile" -category "UserName" -value "Account_Name"

#Close Safe

Close-PVSafe -vault "VAULT" -user "User" -safe "SAFE_Name"
```

#### Disconnect from Vault

```powershell

#Logoff From Vault

Disconnect-PVVault  -vault "VAULT" -user "User"

#Stop Pacli process

Stop-PVPacli
```

### <a id="Pipeline_Support"></a>Working with the Pipeline

Every command sent to the PACLI utility requires the name of the authenticated user as well as the name of the vault defined via ```New-PVVaultDefinition``` to be supplied. There is also the option to run multiple PACLI processes via the ```sessionID``` parameter.

All PoShPACLI functions output the name, vault & sessionID parameter values, meaning they can be used for pipeline operations.
[Custom Formats](Custom_Formats) suppresses display of these values.

#### PACLI Pipeline Token

Goal: Object Containing User, Vault & SessionID values

```powershell
#Start Pacli
$token = Start-PVPACLI -sessionID 42|
#Define Vault
New-PVVaultDefinition -address 192.168.0.1 -vault "DEV" |
#Logon
Connect-PVVault -user PACLIUser -password $password

$token | fl

vault     : DEV
user      : PACLIUser
sessionID : 42

```

A token like the one above can be passed on the pipeline to other PoShPACLI functions, no longer, laboriously, having to type these parameter values for every function:

```powershell
#Open a Safe
$token | Open-PVSafe -safe Safe
#Find a file
$token | Find-PVFile -safe TestSafe -folder Root -filePattern *

#Get File List
$token | Get-PVFileList -safe Safe2 -folder Root
$token | Get-PVFileList -safe Safe3 -folder Root | ? {$_.InternalName -eq "000000000000024"} | Format-List

#Etc...
$token | get-PVSafeEvent -safePatternName XXXyyyZzZ
$token | Get-PVUserList
$token | Get-PVGroupMember -group xSecGroup1
$token | Get-PVSafe -safe testsafe
$token | Get-PVSafeList

```

### <a id="Custom_Formats"></a>Custom Formats

All Output now either has Default Properties assigned, or a TypeName for which  views are configured via the [PoShPACLI.Format.ps1xml](PoShPACLI.Format.ps1xml) File.

Table & List views are configured.

In an attempt to keep output tidy, not all properties are always shown. To see all properties pipe to ```Format-List *```:

```powershell
$token | Get-PVSafe -safe PoShSafe | Format-List *
```

## Author

- **Pete Maan** - [pspete](https://github.com/pspete)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Contributing

Any and all contributions to this project are appreciated.
See the [CONTRIBUTING.md](CONTRIBUTING.md) for a few more details.

## <a id="Pacli_to_PoShPACLI"></a>PACLI to PoShPACLI Function Relationship

The table shows how the the PoShPACLI module functions relate to the native PACLI commands:

|PACLI Command|PoshPACLI Function|
|---:|:---|
|INIT|Start-PVPacli|
|TERM|Stop-PVPacli|
|DEFINEFROMFILE|Import-PVVaultDefinition|
|DEFINE|New-PVVaultDefinition|
|DELETEVAULT|Remove-PVVaultDefinition|
|CREATELOGONFILE|New-PVLogonFile|
|LOGON|Connect-PVVault|
|LOGOFF|Disconnect-PVVault|
|CTLGETFILENAME|Get-PVCTL|
|CTLADDCERT|Add-PVCTLCertificate|
|CTLLIST|Get-PVCTLCertificate|
|CTLREMOVECERT|Remove-PVCTLCertificate|
|STOREFILE|Add-PVFile|
|FINDFILES|Find-PVFile|
|RETRIEVEFILE|Get-PVFile|
|LOCKFILE|Lock-PVFile|
|MOVEFILE|Move-PVFile|
|DELETEFILE|Remove-PVFile|
|RESETFILE|Reset-PVFile|
|UNDELETEFILE|Restore-PVFile|
|UNLOCKFILE|Unlock-PVFile|
|INSPECTFILE|Get-PVFileActivity|
|ADDFILECATEGORY|Add-PVFileCategory|
|LISTFILECATEGORIES|Get-PVFileCategory|
|DELETEFILECATEGORY|Remove-PVFileCategory|
|UPDATEFILECATEGORY|Set-PVFileCategory|
|FILESLIST|Get-PVFileList|
|FILEVERSIONSLIST|Get-PVFileVersionList|
|FOLDERSLIST|Get-PVFolder|
|MOVEFOLDER|Move-PVFolder|
|ADDFOLDER|New-PVFolder|
|DELETEFOLDER|Remove-PVFolder|
|UNDELETEFOLDER|Restore-PVFolder|
|GROUPDETAILS|Get-PVGroup|
|ADDGROUP|New-PVGroup|
|DELETEGROUP|Remove-PVGroup|
|UPDATEGROUP|Set-PVGroup|
|ADDGROUPMEMBER|Add-PVGroupMember|
|GROUPMEMBERS|Get-PVGroupMember|
|DELETEGROUPMEMBER|Remove-PVGroupMember|
|GETHTTPGWURL|Get-PVHttpGwUrl|
|LDAPBRANCHESLIST|Get-PVLDAPBranch|
|LDAPBRANCHADD|New-PVLDAPBranch|
|LDAPBRANCHDELETE|Remove-PVLDAPBranch|
|LDAPBRANCHUPDATE|Set-PVLDAPBranch|
|LOCATIONSLIST|Get-PVLocation|
|ADDLOCATION|New-PVLocation|
|DELETELOCATION|Remove-PVLocation|
|RENAMELOCATION|Rename-PVLocation|
|UPDATELOCATION|Set-PVLocation|
|MAILUSER|Send-PVMailMessage|
|NETWORKAREASLIST|Get-PVNetworkArea|
|MOVENETWORKAREA|Move-PVNetworkArea|
|ADDNETWORKAREA|New-PVNetworkArea|
|DELETENETWORKAREA|Remove-PVNetworkArea|
|RENAMENETWORKAREA|Rename-PVNetworkArea|
|ADDAREAADDRESS|New-PVNetworkAreaAddress|
|DELETEAREAADDRESS|Remove-PVNetworkAreaAddress|
|VALIDATEOBJECT|Set-PVObjectValidation|
|GENERATEPASSWORD|New-PVPassword|
|STOREPASSWORDOBJECT|Add-PVPasswordObject|
|RETRIEVEPASSWORDOBJECT|Get-PVPasswordObject|
|DELETEPREFFEREDFOLDER|Remove-PVPreferredFolder|
|ADDPREFERREDFOLDER|Add-PVPreferredFolder|
|REQUESTSLIST|Get-PVRequest|
|DELETEREQUEST|Remove-PVRequest|
|REQUESTCONFIRMATIONSTATUS|Get-PVRequestStatus|
|CONFIRMREQUEST|Set-PVRequestStatus|
|ADDRULE|Add-PVRule|
|RULESLIST|Get-PVRule|
|DELETERULE|Remove-PVRule|
|CLOSESAFE|Close-PVSafe|
|SAFEDETAILS|Get-PVSafe|
|ADDSAFE|New-PVSafe|
|OPENSAFE|Open-PVSafe|
|DELETESAFE|Remove-PVSafe|
|RENAMESAFE|Rename-PVSafe|
|RESETSAFE|Reset-PVSafe|
|UPDATESAFE|Set-PVSafe|
|INSPECTSAFE|Get-PVSafeActivity|
|SAFEEVENTSLIST|Get-PVSafeEvent|
|ADDEVENT|Write-PVSafeEvent|
|LISTSAFEFILECATEGORIES|Get-PVSafeFileCategory|
|ADDSAFEFILECATEGORY|New-PVSafeFileCategory|
|DELETESAFEFILECATEGORY|Remove-PVSafeFileCategory|
|UPDATESAFEFILECATEGORY|Set-PVSafeFileCategory|
|ADDSAFESHARE|Add-PVSafeGWAccount|
|DELETESAFESHARE|Remove-PVSafeGWAccount|
|CLEARSAFEHISTORY|Clear-PVSafeHistory|
|SAFESLIST|Get-PVSafeList|
|SAFESLOG|Get-PVSafeLog|
|ADDNOTE|Set-PVSafeNote|
|ADDOWNER|Add-PVSafeOwner|
|OWNERSLIST|Get-PVSafeOwner|
|DELETEOWNER|Remove-PVSafeOwner|
|UPDATEOWNER|Set-PVSafeOwner|
|ADDTRUSTEDNETWORKAREA|Add-PVTrustedNetworkArea|
|DEACTIVATETRUSTEDNETWORKAREA|Disable-PVTrustedNetworkArea|
|ACTIVATETRUSTEDNETWORKAREA|Enable-PVTrustedNetworkArea|
|TRUSTEDNETWORKAREALIST|Get-PVTrustedNetworkArea|
|DELETETRUSTEDNETWORKAREA|Remove-PVTrustedNetworkArea|
|USERDETAILS|Get-PVUser|
|LOCK|Lock-PVUser|
|ADDUSER|New-PVUser|
|DELETEUSER|Remove-PVUser|
|RENAMEUSER|Rename-PVUser|
|UPDATEUSER|Set-PVUser|
|UNLOCK|Unlock-PVUser|
|INSPECTUSER|Get-PVUserActivity|
|CLEARUSERHISTORY|Clear-PVUserHistory|
|USERSLIST|Get-PVUserList|
|SETPASSWORD|Set-PVUserPassword|
|GETUSERPHOTO|Get-PVUserPhoto|
|PUTUSERPHOTO|Set-PVUserPhoto|
|OWNERSAFESLIST|Get-PVUserSafeList|
|ADDUPDATEEXTERNALUSERENTITY|Add-PVExternalUser|