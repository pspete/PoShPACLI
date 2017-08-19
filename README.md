# PoShPACLI

**Powershell PACLI Module for CyberArk EPV**

Exposes the native functions of the CyberArk PACLI command line utility via a PowerShell wrapper for interfacing with CyberArk EPV.

----------
## Whats New

- Any Pacli output on StdErr is now written to the PowerShell error stream.
- Boolean output from functions removed
  - **NOTE:** This is a breaking change if the previous $True/$False values are required by an existing script.
- SecureString values now required for any parameters relating to password input.
- Major Change to Module Folder/File Structure.
- All Functions reworked, reducing Parse errors and resolving lots of bugs.

## Getting Started

- Check the [relationship table](#Pacli_to_PoShPACLI) to determine what PoShPACLI function exposes which PACLI command.

### Prerequisites

- The CyberArk PACLI executable must be present on the same computer as the module.

### Install & Use

Save the Module to your powershell modules folder of choice.
Find your local PowerShell module paths with the following command:
```
$env:PSModulePath
```
The name of the folder for the module should be "PoShPACLI".

Import the module:

```
Import-Module PoShPACLI
```
Discover Commands:
```
Get-Command -Module PoShPACLI
```
Function Initialize-PoShPACLI must be run before working with the other module functions:
```
Initialize-PoShPACLI -pacliFolder D:\PACLI
```
This is required to locate the CyberArk PACLI execuatable in the SYSTEM path, or in a folder you specify, in order for the module to be able to execute the utility.

----------

An identical process to using the PACLI tool on its own should be followed:

Example method to use the module to add a password object to a safe:
```
#Locate/set path to PACLI executable

Initialize-PoShPACLI

#Start PACLI Executable

Start-PVPacli

#Define Vault

New-PVVaultDefinition -vault "VAULT" -address "vaultAddress"

#Logon to vault

Connect-PVVault -vault "VAULT" -user "User" -logonFile "credfile.xxx"

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

#Logoff From Vault

Disconnect-PVVault  -vault "VAULT" -user "User"

#Stop Pacli process

Stop-PVPacli
```

## Author

* **Pete Maan** - [pspete](https://github.com/pspete)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Contributing
Any and all contributions to this project are appreciated.
See the [CONTRIBUTING.md](CONTRIBUTING.md) for a few more details.

## <a id="Pacli_to_PoShPACLI"></a>PACLI to PoShPACLI Function Relationship

The table shows how the the PoShPACLI module functions relate to the native PACLI commands:

|PACLI Command|PoshPACLI Function|
|---:|:---|
|INIT|Start-PVPacli
|TERM|Stop-PVPacli
|DEFINE|New-PVVaultDefinition
|DEFINEFROMFILE|Import-PVVaultDefinition
|DELETEVAULT|Remove-PVVaultDefinition
|LOGON|Connect-PVVault
|CREATELOGONFILE|New-PVLogonFile
|LOGOFF|Disconnect-PVVault
|SETPASSWORD|Set-PVUserPassword
|LOCK|Lock-PVUser
|UNLOCK|Unlock-PVUser
|ADDUSER|New-PVUser
|UPDATEUSER|Set-PVUser
|RENAMEUSER|Rename-PVUser
|DELETEUSER|Remove-PVUser
|ADDUPDATEEXTERNALUSERENTITY|Add-PVExternalUser
|USERDETAILS|Get-PVUser
|USERSLIST|Get-PVUserList
|INSPECTUSER|Get-PVUserActivity
|SAFESLOG|Get-PVSafeLog
|CLEARUSERHISTORY|Clear-PVUserHistory
|PUTUSERPHOTO|Set-PVUserPhoto
|GETUSERPHOTO|Get-PVUserPhoto
|MAILUSER|Send-PVMailMessage
|ADDSAFESHARE|Add-PVSafeGWAccount
|DELETESAFESHARE|Remove-PVSafeGWAccount
|ADDGROUP|New-PVGroup
|UPDATEGROUP|Set-PVGroup
|DELETEGROUP|Remove-PVGroup
|ADDGROUPMEMBER|Add-PVGroupMember
|DELETEGROUPMEMBER|Remove-PVGroupMember
|ADDLOCATION|New-PVLocation
|UPDATELOCATION|Set-PVLocation
|RENAMELOCATION|Rename-PVLocation
|DELETELOCATION|Remove-PVLocation
|LOCATIONSLIST|Get-PVLocation
|GROUPDETAILS|Get-PVGroup
|GROUPMEMBERS|Get-PVGroupMember
|LDAPBRANCHADD|New-PVLDAPBranch
|LDAPBRANCHUPDATE|Set-PVLDAPBranch
|LDAPBRANCHDELETE|Remove-PVLDAPBranch
|LDAPBRANCHESLIST|Get-PVLDAPBranch
|ADDNETWORKAREA|New-PVNetworkArea
|DELETENETWORKAREA|Remove-PVNetworkArea
|MOVENETWORKAREA|Move-PVNetworkArea
|RENAMENETWORKAREA|Rename-PVNetworkArea
|NETWORKAREASLIST|Get-PVNetworkArea
|ADDAREAADDRESS|New-PVNetworkAreaAddress
|DELETEAREAADDRESS|Remove-PVNetworkAreaAddress
|ADDTRUSTEDNETWORKAREA|Add-PVTrustedNetworkArea
|DELETETRUSTEDNETWORKAREA|Remove-PVTrustedNetworkArea
|TRUSTEDNETWORKAREALIST|Get-PVTrustedNetworkArea
|ACTIVATETRUSTEDNETWORKAREA|Enable-PVTrustedNetworkArea
|DEACTIVATETRUSTEDNETWORKAREA|Disable-PVTrustedNetworkArea
|OPENSAFE|Open-PVSafe
|CLOSESAFE|Close-PVSafe
|ADDSAFE|New-PVSafe
|UPDATESAFE|Set-PVSafe
|RENAMESAFE|Rename-PVSafe
|DELETESAFE|Remove-PVSafe
|ADDOWNER|Add-PVSafeOwner
|UPDATEOWNER|Set-PVSafeOwner
|DELETEOWNER|Remove-PVSafeOwner
|OWNERSAFESLIST|Get-PVUserSafeList
|SAFEDETAILS|Get-PVSafe
|SAFESLIST|Get-PVSafeList
|OWNERSLIST|Get-PVSafeOwner
|INSPECTSAFE|Get-PVSafeActivity
|ADDSAFEFILECATEGORY|New-PVSafeFileCategory
|UPDATESAFEFILECATEGORY|Set-PVSafeFileCategory
|DELETESAFEFILECATEGORY|Remove-PVSafeFileCategory
|LISTSAFEFILECATEGORIES|Get-PVSafeFileCategory
|ADDEVENT|Set-PVSafeEvent
|SAFEEVENTSLIST|Get-PVSafeEvent
|ADDNOTE|Set-PVSafeNote
|RESETSAFE|Reset-PVSafe
|CLEARSAFEHISTORY|Clear-PVSafeHistory
|ADDFOLDER|New-PVFolder
|DELETEFOLDER|Remove-PVFolder
|UNDELETEFOLDER|Restore-PVFolder
|MOVEFOLDER|Move-PVFolder
|FOLDERSLIST|Get-PVFolder
|ADDPREFERREDFOLDER|Add-PVPreferredFolder
|DELETEPREFFEREDFOLDER|Remove-PVPreferredFolder
|STOREFILE|Add-PVFile
|RETRIEVEFILE|Get-PVFile
|DELETEFILE|Remove-PVFile
|UNDELETEFILE|Restore-PVFile
|STOREPASSWORDOBJECT|Add-PVPasswordObject
|RETRIEVEPASSWORDOBJECT|Get-PVPasswordObject
|LOCKFILE|Lock-PVFile
|UNLOCKFILE|Unlock-PVFile
|MOVEFILE|Move-PVFile
|FINDFILES|Find-PVFile
|FILESLIST|Get-PVFileList
|FILEVERSIONSLIST|Get-PVFileVersionList
|RESETFILE|Reset-PVFile
|INSPECTFILE|Get-PVFileActivity
|ADDFILECATEGORY|Add-PVFileCategory
|UPDATEFILECATEGORY|Set-PVFileCategory
|DELETEFILECATEGORY|Remove-PVFileCategory
|LISTFILECATEGORIES|Get-PVFileCategory
|VALIDATEOBJECT|Set-PVObjectValidation
|GETHTTPGWURL|Get-PVHttpGwUrl
|ADDRULE|Add-PVRule
|DELETERULE|Remove-PVRule
|RULESLIST|Get-PVRule
|REQUESTSLIST|Get-PVRequest
|CONFIRMREQUEST|Set-PVRequestStatus
|DELETEREQUEST|Remove-PVRequest
|REQUESTCONFIRMATIONSTATUS|Get-PVRequestStatus
|GENERATEPASSWORD|New-PVPassword
|CTLGETFILENAME|Get-PVCTL
|CTLADDCERT|Add-PVCTLCertificate
|CTLREMOVECERT|Remove-PVCTLCertificate
|CTLLIST|Get-PVCTLCertificate
|GENERATEPASSWORD|New-PVPassword