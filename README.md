![Disconnect-from-Vault](/media/PoShPACLI.png)

## **Powershell PACLI Module for CyberArk EPV**

[![appveyor][]][av-site]
[![codefactor][]][cf-link]
[![coveralls][]][cv-site]
[![psgallery][]][ps-site]
[![downloads][]][ps-site]
[![license][]][license-link]

[appveyor]:https://ci.appveyor.com/api/projects/status/0kmmudd6y4i886eo/branch/master?svg=true
[av-site]:https://ci.appveyor.com/project/pspete/poshpacli/branch/master
[tests]:https://img.shields.io/appveyor/tests/pspete/poshpacli.svg
[tests-site]:https://ci.appveyor.com/project/pspete/poshpacli
[coveralls]:https://coveralls.io/repos/github/pspete/PoShPACLI/badge.svg
[cv-site]:https://coveralls.io/github/pspete/PoShPACLI
[psgallery]:https://img.shields.io/powershellgallery/v/PoShPACLI.svg
[ps-site]:https://www.powershellgallery.com/packages/PoShPACLI
[license]:https://img.shields.io/github/license/pspete/poshpacli.svg
[license-link]:https://github.com/pspete/PoShPACLI/blob/master/LICENSE.md
[codefactor]:https://www.codefactor.io/repository/github/pspete/poshpacli/badge
[cf-link]:https://www.codefactor.io/repository/github/pspete/poshpacli
[downloads]:https://img.shields.io/powershellgallery/dt/poshpacli.svg?color=blue

Use the native functions of the CyberArk PACLI command line utility in PowerShell.

If you are landing here and interested in using PowerShell to automate an aspect of CyberArk,

**I recommend investigating my [psPAS](https://github.com/pspete/psPAS) module first**, to see if you can achieve what you need with the REST API.

----------

- [PoShPACLI](#poshpacli)
  - [Usage & Examples](#usage-&-examples)
  - [PACLI to PoShPACLI Function Relationship](#pacli-to-poshpacli-function-relationship)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation Options](#installation-options)
  - [Changelog](#changelog)
  - [License](#license)
  - [Contributing](#contributing)

### Usage & Examples

An identical process to using the PACLI tool on its own should be followed.

- Check the [relationship table](#pacli-to-poshpacli-function-relationship) to determine what PoShPACLI function exposes which PACLI command.

#### Initial Configuration

`Set-PVConfiguration` must be run before using the module for the first time.
This function identifies the location of the `PACLI.exe` utility to the module.

![Set-PVConfiguration](/media/Set-PVConfiguration.png)

#### Example: Connecting to a Vault

![Connecting-to-a-Vault](/media/Connecting-to-a-Vault.png)

#### Example: Add Password Object to Safe

![Add-Password-Object-to-Safe](/media/Add-Password-Object-to-Safe.png)

#### Example: Disconnect from Vault

![Disconnect-from-Vault](/media/Disconnect-from-Vault.png)

#### PACLI Pipeline Token

Goal: Object Containing User, Vault & SessionID values

![PACLI-Pipeline-Token](/media/PACLI-Pipeline-Token.png)

A variable, like the above `$token`, can be passed on the pipeline to other PoShPACLI functions, providing the necessary values for mandatory parameters:

![Token-Example-1](/media/Token-Example-1.png)

![Token-Example-2](/media/Token-Example-2.png)

![Token-Example-3](/media/Token-Example-3.png)

![Token-Example-4](/media/Token-Example-4.png)

#### PACLI Pipeline Examples

Output can be piped between PoShPACLI functions as shown in the following examples:

##### Open & Close Safes

![Pipeline-Example-1](/media/Pipeline-Example-1.png)

##### Get File Activities

![Pipeline-Example-2](/media/Pipeline-Example-2.png)

##### Update File Categories

![Pipeline-Example-3](/media/Pipeline-Example-3.png)

##### Get Safe Owner Activities

![Pipeline-Example-4](/media/Pipeline-Example-4.png)

##### Get Safe Events

![Pipeline-Example-5](/media/Pipeline-Example-5.png)

##### Remove a Safe Owner

![Pipeline-Example-6](/media/Pipeline-Example-6.png)

##### Disable Users

![Pipeline-Example-7](/media/Pipeline-Example-7.png)

##### Disable a single User

![Pipeline-Example-8](/media/Pipeline-Example-8.png)

##### Rename a single User

![Pipeline-Example-9](/media/Pipeline-Example-9.png)

##### Remove Group Members

![Pipeline-Example-10](/media/Pipeline-Example-10.png)

##### Manage Group Members

![Pipeline-Example-11](/media/Pipeline-Example-11.png)

##### Get Status of Requests

![Pipeline-Example-12](/media/Pipeline-Example-12.png)

##### Disable Network Areas

![Pipeline-Example-13](/media/Pipeline-Example-13.png)

##### Find & Delete Files

![Pipeline-Example-14](/media/Pipeline-Example-14.png)

## PACLI to PoShPACLI Function Relationship

The table shows how the the PoShPACLI module functions relate to their native PACLI counterparts:

|PACLI Command|PoshPACLI Function|
|---:|:---|
|INIT|`Start-PVPacli`|
|TERM|`Stop-PVPacli`|
|DEFINEFROMFILE|`Import-PVVaultDefinition`|
|DEFINE|`New-PVVaultDefinition`|
|CREATELOGONFILE|`New-PVLogonFile`|
|LOGON|`Connect-PVVault`|
|LOGOFF|`Disconnect-PVVault`|
|CTLGETFILENAME|`Get-PVCTL`|
|CTLADDCERT|`Add-PVCTLCertificate`|
|CTLLIST|`Get-PVCTLCertificate`|
|CTLREMOVECERT|`Remove-PVCTLCertificate`|
|STOREFILE|`Add-PVFile`|
|FINDFILES|`Find-PVFile`|
|RETRIEVEFILE|`Get-PVFile`|
|LOCKFILE|`Lock-PVFile`|
|MOVEFILE|`Move-PVFile`|
|DELETEFILE|`Remove-PVFile`|
|RESETFILE|`Reset-PVFile`|
|UNDELETEFILE|`Restore-PVFile`|
|UNLOCKFILE|`Unlock-PVFile`|
|INSPECTFILE|`Get-PVFileActivity`|
|ADDFILECATEGORY|`Add-PVFileCategory`|
|LISTFILECATEGORIES|`Get-PVFileCategory`|
|DELETEFILECATEGORY|`Remove-PVFileCategory`|
|UPDATEFILECATEGORY|`Set-PVFileCategory`|
|FILESLIST|`Get-PVFileList`|
|FILEVERSIONSLIST|`Get-PVFileVersionList`|
|FOLDERSLIST|`Get-PVFolder`|
|MOVEFOLDER|`Move-PVFolder`|
|ADDFOLDER|`New-PVFolder`|
|DELETEFOLDER|`Remove-PVFolder`|
|UNDELETEFOLDER|`Restore-PVFolder`|
|GROUPDETAILS|`Get-PVGroup`|
|ADDGROUP|`New-PVGroup`|
|DELETEGROUP|`Remove-PVGroup`|
|UPDATEGROUP|`Set-PVGroup`|
|ADDGROUPMEMBER|`Add-PVGroupMember`|
|GROUPMEMBERS|`Get-PVGroupMember`|
|DELETEGROUPMEMBER|`Remove-PVGroupMember`|
|LDAPBRANCHESLIST|`Get-PVLDAPBranch`|
|LDAPBRANCHADD|`New-PVLDAPBranch`|
|LDAPBRANCHDELETE|`Remove-PVLDAPBranch`|
|LDAPBRANCHUPDATE|`Set-PVLDAPBranch`|
|LOCATIONSLIST|`Get-PVLocation`|
|ADDLOCATION|`New-PVLocation`|
|DELETELOCATION|`Remove-PVLocation`|
|RENAMELOCATION|`Rename-PVLocation`|
|UPDATELOCATION|`Set-PVLocation`|
|MAILUSER|`Send-PVMailMessage`|
|NETWORKAREASLIST|`Get-PVNetworkArea`|
|MOVENETWORKAREA|`Move-PVNetworkArea`|
|ADDNETWORKAREA|`New-PVNetworkArea`|
|DELETENETWORKAREA|`Remove-PVNetworkArea`|
|RENAMENETWORKAREA|`Rename-PVNetworkArea`|
|ADDAREAADDRESS|`New-PVNetworkAreaAddress`|
|DELETEAREAADDRESS|`Remove-PVNetworkAreaAddress`|
|VALIDATEOBJECT|`Set-PVObjectValidation`|
|GENERATEPASSWORD|`New-PVPassword`|
|STOREPASSWORDOBJECT|`Add-PVPasswordObject`|
|RETRIEVEPASSWORDOBJECT|`Get-PVPasswordObject`|
|DELETEPREFFEREDFOLDER|`Remove-PVPreferredFolder`|
|ADDPREFERREDFOLDER|`Add-PVPreferredFolder`|
|REQUESTSLIST|`Get-PVRequest`|
|DELETEREQUEST|`Remove-PVRequest`|
|REQUESTCONFIRMATIONSTATUS|`Get-PVRequestStatus`|
|CONFIRMREQUEST|`Set-PVRequestStatus`|
|ADDRULE|`Add-PVRule`|
|RULESLIST|`Get-PVRule`|
|DELETERULE|`Remove-PVRule`|
|CLOSESAFE|`Close-PVSafe`|
|SAFEDETAILS|`Get-PVSafe`|
|ADDSAFE|`New-PVSafe`|
|OPENSAFE|`Open-PVSafe`|
|DELETESAFE|`Remove-PVSafe`|
|RENAMESAFE|`Rename-PVSafe`|
|RESETSAFE|`Reset-PVSafe`|
|UPDATESAFE|`Set-PVSafe`|
|INSPECTSAFE|`Get-PVSafeActivity`|
|SAFEEVENTSLIST|`Get-PVSafeEvent`|
|ADDEVENT|`Write-PVSafeEvent`|
|LISTSAFEFILECATEGORIES|`Get-PVSafeFileCategory`|
|ADDSAFEFILECATEGORY|`New-PVSafeFileCategory`|
|DELETESAFEFILECATEGORY|`Remove-PVSafeFileCategory`|
|UPDATESAFEFILECATEGORY|`Set-PVSafeFileCategory`|
|ADDSAFESHARE|`Add-PVSafeGWAccount`|
|DELETESAFESHARE|`Remove-PVSafeGWAccount`|
|CLEARSAFEHISTORY|`Clear-PVSafeHistory`|
|SAFESLIST|`Get-PVSafeList`|
|SAFESLOG|`Get-PVSafeLog`|
|ADDNOTE|`Set-PVSafeNote`|
|ADDOWNER|`Add-PVSafeOwner`|
|OWNERSLIST|`Get-PVSafeOwner`|
|DELETEOWNER|`Remove-PVSafeOwner`|
|UPDATEOWNER|`Set-PVSafeOwner`|
|ADDTRUSTEDNETWORKAREA|`Add-PVTrustedNetworkArea`|
|DEACTIVATETRUSTEDNETWORKAREA|`Disable-PVTrustedNetworkArea`|
|ACTIVATETRUSTEDNETWORKAREA|`Enable-PVTrustedNetworkArea`|
|TRUSTEDNETWORKAREALIST|`Get-PVTrustedNetworkArea`|
|DELETETRUSTEDNETWORKAREA|`Remove-PVTrustedNetworkArea`|
|USERDETAILS|`Get-PVUser`|
|LOCK|`Lock-PVUser`|
|ADDUSER|`New-PVUser`|
|DELETEUSER|`Remove-PVUser`|
|RENAMEUSER|`Rename-PVUser`|
|UPDATEUSER|`Set-PVUser`|
|UNLOCK|`Unlock-PVUser`|
|INSPECTUSER|`Get-PVUserActivity`|
|CLEARUSERHISTORY|`Clear-PVUserHistory`|
|USERSLIST|`Get-PVUserList`|
|SETPASSWORD|`Set-PVUserPassword`|
|GETUSERPHOTO|`Get-PVUserPhoto`|
|PUTUSERPHOTO|`Set-PVUserPhoto`|
|OWNERSAFESLIST|`Get-PVUserSafeList`|
|ADDUPDATEEXTERNALUSERENTITY|`Add-PVExternalUser`|

## Getting Started

### Prerequisites

- Requires Powershell v3 (minimum)
- The CyberArk PACLI executable must be present on the same computer as the module.
  - **NOTE**: Issues have been reported & observed when using the module with Pacli versions 4.X & 9.X.
    - PACLI 7.2 was used for development, your mileage may vary with *any* other version.
- A CyberArk user with which to authenticate, which has appropriate Vault/Safe permissions.

### Installation Options

This repository contains a folder named ```PoShPACLI```.

The folder and it's contents needs to be present in one of your PowerShell Module Directories.

Use one of the following methods:

#### Option 1: Install from PowerShell Gallery

Download the module from the [PowerShell Gallery](https://www.powershellgallery.com/packages/PoShPACLI/).

- PowerShell 5.0 or above required.

From a PowerShell prompt, run:

````powershell
Install-Module -Name PoShPACLI -Scope CurrentUser
````

#### Option 2: Manual Install

Find your PowerShell Module Paths with the following command:

```powershell

$env:PSModulePath.split(';')

```

[Download the ```master``` branch](https://github.com/pspete/PoShPACLI/archive/master.zip)

Extract the archive

Copy the ```PoShPACLI``` folder to your "Powershell Modules" directory of choice.

### Verification

Validate Module Exists on your local machine:

````powershell
Get-Module -ListAvailable PoShPACLI
````

Import the module:

````powershell
Import-Module PoShPACLI
````

List Module Commands:

````powershell
Get-Command -Module PoShPACLI
````

Get detailed information on specific commands:

````powershell
Get-Help Open-PVSafe -Full
````

## Changelog

All notable changes to this project will be documented in the [Changelog](CHANGELOG.md)

## Author

- **Pete Maan** - [pspete](https://github.com/pspete)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Contributing

Any and all contributions to this project are appreciated.
See the [CONTRIBUTING.md](CONTRIBUTING.md) for a few more details.