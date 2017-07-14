# PoShPACLI

**Powershell PACLI Module for CyberArk EPV**

Exposes the native functions of the CyberArk PACLI command line utility via a PowerShell wrapper for interfacing with CyberArk EPV.

----------
## Whats New
 - Minor Bug Fix 
 - Major Change to Module Folder/File Structure

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
|INIT|Start-Pacli
|TERM|Stop-Pacli
|DEFINE|Add-VaultDefinition
|DEFINEFROMFILE|Read-VaultConfigFile
|DELETEVAULT|Remove-VaultDefinition
|LOGON|Connect-Vault
|CREATELOGONFILE|New-LogonFile
|LOGOFF|Disconnect-Vault
|SETPASSWORD|Set-Password
|LOCK|Lock-User
|UNLOCK|Unlock-User
|ADDUSER|Add-User
|UPDATEUSER|Update-User
|RENAMEUSER|Rename-User
|DELETEUSER|Remove-User
|ADDUPDATEEXTERNALUSERENTITY|Add-ExternalUser
|USERDETAILS|Get-UserDetails
|USERSLIST|Get-VaultUsers
|INSPECTUSER|Get-UserActivity
|SAFESLOG|Get-SafesLog
|CLEARUSERHISTORY|Clear-UserHistory
|PUTUSERPHOTO|Set-UserPhoto
|GETUSERPHOTO|Get-UserPhoto
|MAILUSER|Send-PAMailMessage
|ADDSAFESHARE|Add-SafeShare
|DELETESAFESHARE|Remove-SafeShare
|ADDGROUP|Add-Group
|UPDATEGROUP|Update-Group
|DELETEGROUP|Remove-Group
|ADDGROUPMEMBER|Add-GroupMamber
|DELETEGROUPMEMBER|Remove-GroupMamber
|ADDLOCATION|Add-Location
|UPDATELOCATION|Update-Location
|RENAMELOCATION|Rename-Location
|DELETELOCATION|Remove-Location
|LOCATIONSLIST|Get-Locations
|GROUPDETAILS|Get-GroupDetails
|GROUPMEMBERS|Get-GroupMembers
|LDAPBRANCHADD|Add-LDAPBranch
|LDAPBRANCHUPDATE|Update-LDAPBranch
|LDAPBRANCHDELETE|Remove-LDAPBranch
|LDAPBRANCHESLIST|Get-LDAPBranches
|ADDNETWORKAREA|Add-NetworkArea
|DELETENETWORKAREA|Remove-NetworkArea
|MOVENETWORKAREA|Move-NetworkArea
|RENAMENETWORKAREA|RenameNetworkArea
|NETWORKAREASLIST|Get-NetworkArea
|ADDAREAADDRESS|Add-AreaAddress
|DELETEAREAADDRESS|Remove-AreaAddress
|ADDTRUSTEDNETWORKAREA|Add-TrustedNetworkArea
|DELETETRUSTEDNETWORKAREA|Remove-TrustedNetworkArea
|TRUSTEDNETWORKAREALIST|Get-TrustedNetworkArea
|ACTIVATETRUSTEDNETWORKAREA|Enable-TrustedNetworkArea
|DEACTIVATETRUSTEDNETWORKAREA|Disable-TrustedNetworkArea
|OPENSAFE|Open-Safe
|CLOSESAFE|Close-Safe
|ADDSAFE|Add-Safe
|UPDATESAFE|Update-Safe
|RENAMESAFE|Rename-Safe
|DELETESAFE|Remove-Safe
|ADDOWNER|Add-SafeOwner
|UPDATEOWNER|Update-SafeOwner
|DELETEOWNER|Remove-SafeOwner
|OWNERSAFESLIST|Get-OwnerSafes
|SAFEDETAILS|Get-SafeDetails
|SAFESLIST|Get-Safe
|OWNERSLIST|Get-SafeOwners
|INSPECTSAFE|Get-SafeActivity
|ADDSAFEFILECATEGORY|Add-SafeFileCategory
|UPDATESAFEFILECATEGORY|Update-SafeFileCategory
|DELETESAFEFILECATEGORY|Remove-SafeFileCategory
|LISTSAFEFILECATEGORIES|Get-SafeFileCategory
|ADDEVENT|Add-SafeEvent
|SAFEEVENTSLIST|Get-SafeEvents
|ADDNOTE|Add-SafeNote
|RESETSAFE|Reset-Safe
|CLEARSAFEHISTORY|Clear-SafeHistory
|ADDFOLDER|Add-Folder
|DELETEFOLDER|Remove-Folder
|UNDELETEFOLDER|RestoreFolder
|MOVEFOLDER|Move-Folder
|FOLDERSLIST|Get-Folder
|ADDPREFERREDFOLDER|Add-PreferredFolder
|DELETEPREFFEREDFOLDER|Remove-PreferredFolder
|STOREFILE|Add-File
|RETRIEVEFILE|Get-File
|DELETEFILE|Remove-File
|UNDELETEFILE|Restore-File
|STOREPASSWORDOBJECT|Add-PasswordObject
|RETRIEVEPASSWORDOBJECT|Get-PasswordObject
|LOCKFILE|Lock-File
|UNLOCKFILE|Unlock-File
|MOVEFILE|Move-File
|FINDFILES|Search-Files
|FILESLIST|Get-FilesList
|FILEVERSIONSLIST|Get-FileversionsList
|RESETFILE|Reset-File
|INSPECTFILE|Get-FileActivity
|ADDFILECATEGORY|Add-FileCategory
|UPDATEFILECATEGORY|Update-FileCategory
|DELETEFILECATEGORY|Remove-FileCategory
|LISTFILECATEGORIES|Get-FileCategories
|VALIDATEOBJECT|Confirm-Object
|GETHTTPGWURL|Get-HttpGwUrl
|ADDRULE|Add-Rule
|DELETERULE|Remove-Rule
|RULESLIST|Get-RulesList
|REQUESTSLIST|Get-RequestsList
|CONFIRMREQUEST|Confirm-Request
|DELETEREQUEST|Remove-Request
|REQUESTCONFIRMATIONSTATUS|Get-RequestConfirmationStatus
|GENERATEPASSWORD|New-Password
|CTLGETFILENAME|Get-CtlFileName
|CTLADDCERT|Add-CTLCert
|CTLREMOVECERT|Remove-CTLCert
|CTLLIST|Get-CtlList
|GENERATEPASSWORD|New-Password
|CTLGETFILENAME|Get-CtlFileName
|CTLADDCERT|Add-CTLCert
|CTLREMOVECERT|Remove-CTLCert
|CTLLIST|Get-CtlList