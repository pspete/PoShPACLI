![PoShPACLI](/media/PoShPACLI.png)

# PoShPACLI

**PowerShell module for the CyberArk PACLI command line utility**

[![build][]][build-site] [![dev][]][dev-site] [![codefactor][]][cf-site] [![codecov][]][codecov-link] [![psgallery][]][ps-site] [![downloads][]][ps-site] [![license][]][license-link]

[build]:https://github.com/pspete/PoShPACLI/actions/workflows/ci.yml/badge.svg?branch=master&event=push
[build-site]:https://github.com/pspete/PoShPACLI/actions/workflows/ci.yml?query=branch%3Amaster
[dev]:https://github.com/pspete/PoShPACLI/actions/workflows/ci.yml/badge.svg?branch=dev&event=push
[dev-site]:https://github.com/pspete/PoShPACLI/actions/workflows/ci.yml?query=branch%3Adev
[psgallery]:https://img.shields.io/powershellgallery/v/PoShPACLI.svg
[ps-site]:https://www.powershellgallery.com/packages/PoShPACLI
[downloads]:https://img.shields.io/powershellgallery/dt/poshpacli.svg?color=blue
[cf-site]:https://www.codefactor.io/repository/github/pspete/poshpacli
[codefactor]:https://www.codefactor.io/repository/github/pspete/poshpacli/badge
[codecov]:https://codecov.io/gh/pspete/PoShPACLI/branch/master/graph/badge.svg
[codecov-link]:https://codecov.io/gh/pspete/PoShPACLI
[license]:https://img.shields.io/github/license/pspete/poshpacli.svg
[license-link]:https://github.com/pspete/PoShPACLI/blob/master/LICENSE.md

PoShPACLI runs CyberArk PACLI commands as PowerShell functions. Results come back as objects, so you can pipe them into other commands.

> [!TIP]
> Automating CyberArk? Look at [psPAS](https://github.com/pspete/psPAS) first: it uses the REST API, which covers most tasks.
> PoShPACLI is for jobs that still need PACLI.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [Command Reference](#command-reference)
- [Changelog](#changelog) · [License](#license) · [Contributing](#contributing)

## Features

- **One function per PACLI command**: 116 functions with full help (`Get-Help <Function> -Full`).
- **Session values remembered**: `sessionID`, `vault` and `user` are kept by the module and added to every command for you.
- **Object output**: list commands return typed objects with formatting, ready for the pipeline.
- **Tab completion**: safe, user, group, location and network area names complete from the connected vault.
- **Secret handling**: passwords are `SecureString` values. They are decoded only when the PACLI process starts, masked in `-WhatIf` and `-Debug` output, and kept out of PowerShell logging.
- **`-WhatIf` support**: commands that create, change or remove vault data show the PACLI command line without running it.

## Requirements

| Component          | Version                                                         |
| ------------------ | --------------------------------------------------------------- |
| PowerShell         | Windows PowerShell 5.1 or PowerShell 7.x on Windows               |
| CyberArk PACLI     | 7.2 or later (current releases supported)                       |
| CyberArk Vault user | Vault and Safe permissions for the operations you run          |

PACLI is part of the CyberArk PACLI package, available from the CyberArk Marketplace. Install it on the same computer as the module.

## Installation

### From the PowerShell Gallery (recommended)

```powershell
Install-Module -Name PoShPACLI -Scope CurrentUser
```

### Manual install

1. Download a [release](https://github.com/pspete/PoShPACLI/releases) or the [master branch](https://github.com/pspete/PoShPACLI/archive/master.zip).
2. Copy the `PoShPACLI` folder to a directory listed in `$env:PSModulePath`.

### Verify

```powershell
Import-Module PoShPACLI
Get-Command -Module PoShPACLI
```

## Quick Start

```powershell
# One-time: point the module at PACLI.exe (saved to ~\PV_Configuration.xml)
Set-PVConfiguration -ClientPath D:\PACLI\Pacli.exe

# Create a logon file once, instead of passing a password on the command line
New-PVLogonFile -logonFile "$env:USERPROFILE\vault.cred" -username administrator -password (Read-Host -AsSecureString)

# Start a session, define the vault and log on
Start-PVPacli -sessionID 1
New-PVVaultDefinition -vault Vault -address 10.0.0.10
Connect-PVVault -user administrator -logonFile "$env:USERPROFILE\vault.cred"

# Work with the vault
Get-PVSafeList | Select-Object Safename, Location

# Log off and stop PACLI
Disconnect-PVVault
Stop-PVPacli
```

After `Start-PVPacli`, `New-PVVaultDefinition` and `Connect-PVVault`, later commands use the same session, vault and user. Check the current values with `Get-PVConfiguration`.

## Usage

PoShPACLI follows the same steps as PACLI: start a session, define a vault, log on, open safes, run commands, then log off.
[Command Reference](#command-reference) shows which function runs each PACLI command.

### Store and retrieve a password object

```powershell
Open-PVSafe -safe Linux-Accounts
New-PVFolder -safe Linux-Accounts -folder Root\Servers

Add-PVPasswordObject -safe Linux-Accounts -folder Root\Servers -file root-web01 -password (Read-Host -AsSecureString)

# Returns the password as a SecureString
$Secret = Get-PVPasswordObject -safe Linux-Accounts -folder Root\Servers -file root-web01 -AsSecureString

Close-PVSafe -safe Linux-Accounts
```

`-AsSecureString` keeps the password out of plain-text output and pipeline logs.

### Pipeline

Functions accept pipeline input by property name, so output from one command feeds the next:

```powershell
# Details of every safe in a location
Get-PVSafeList -location \Linux | Get-PVSafe | Select-Object Safename, Size, Location

# Open each safe in a location and list its files
Get-PVSafeList -location \Linux | Open-PVSafe | Get-PVFileList -folder Root
```

### Tab completion

When connected to a vault, `Tab` completes names from the vault:

| Parameter                                    | Completes            |
| -------------------------------------------- | -------------------- |
| `safe`, `safeName`                           | Safe names           |
| `destUser`, `owner`, `member`, `trusterName` | User and group names |
| `group`                                      | Group names          |
| `location`                                   | Location paths       |
| `networkArea`                                | Network area names   |

```powershell
Open-PVSafe -safe Lin<Tab>
# Open-PVSafe -safe Linux-Accounts
```

- Results are cached for 5 minutes per vault, user and session.
- Locations complete with or without the leading `\`.
- Parameters that take a new name, such as `New-PVSafe -safe`, are not completed.

### Preview a command

Commands that create, change or remove vault data support `-WhatIf`, which shows the PACLI command line without running it. Secret values are masked.

```powershell
Remove-PVSafeOwner -safe Linux-Accounts -owner jsmith -WhatIf
```

### Security notes

- Use `Connect-PVVault -logonFile` instead of `-password`. PACLI receives passwords as plain text on its process command line, so other processes on the machine can read them. `Connect-PVVault` warns when `-password` is used.
- `PV_Configuration.xml` in your profile stores the PACLI path, session ID, vault name and user name. It stores no credentials.

## Command Reference

Each function runs one PACLI command. The tables below are grouped by area.
Full help: `Get-Help <Function> -Full`.

<details>
<summary><b>Module configuration</b></summary>

| PACLI command | Function              |
| ------------- | --------------------- |
| -             | `Set-PVConfiguration` |
| -             | `Get-PVConfiguration` |
| INIT          | `Start-PVPacli`       |
| TERM          | `Stop-PVPacli`        |

</details>

<details>
<summary><b>Session management</b></summary>

| PACLI command   | Function                   |
| --------------- | -------------------------- |
| DEFINE          | `New-PVVaultDefinition`    |
| DEFINEFROMFILE  | `Import-PVVaultDefinition` |
| CREATELOGONFILE | `New-PVLogonFile`          |
| LOGON           | `Connect-PVVault`          |
| LOGOFF          | `Disconnect-PVVault`       |
| CTLGETFILENAME  | `Get-PVCTL`                |
| CTLADDCERT      | `Add-PVCTLCertificate`     |
| CTLLIST         | `Get-PVCTLCertificate`     |
| CTLREMOVECERT   | `Remove-PVCTLCertificate`  |

</details>

<details>
<summary><b>Safes</b></summary>

| PACLI command          | Function                    |
| ---------------------- | --------------------------- |
| SAFESLIST              | `Get-PVSafeList`            |
| SAFEDETAILS            | `Get-PVSafe`                |
| ADDSAFE                | `New-PVSafe`                |
| UPDATESAFE             | `Set-PVSafe`                |
| RENAMESAFE             | `Rename-PVSafe`             |
| DELETESAFE             | `Remove-PVSafe`             |
| OPENSAFE               | `Open-PVSafe`               |
| CLOSESAFE              | `Close-PVSafe`              |
| RESETSAFE              | `Reset-PVSafe`              |
| CLEARSAFEHISTORY       | `Clear-PVSafeHistory`       |
| INSPECTSAFE            | `Get-PVSafeActivity`        |
| SAFESLOG               | `Get-PVSafeLog`             |
| ADDNOTE                | `Set-PVSafeNote`            |
| SAFEEVENTSLIST         | `Get-PVSafeEvent`           |
| ADDEVENT               | `Write-PVSafeEvent`         |
| OWNERSLIST             | `Get-PVSafeOwner`           |
| ADDOWNER               | `Add-PVSafeOwner`           |
| UPDATEOWNER            | `Set-PVSafeOwner`           |
| DELETEOWNER            | `Remove-PVSafeOwner`        |
| OWNERSAFESLIST         | `Get-PVUserSafeList`        |
| LISTSAFEFILECATEGORIES | `Get-PVSafeFileCategory`    |
| ADDSAFEFILECATEGORY    | `New-PVSafeFileCategory`    |
| UPDATESAFEFILECATEGORY | `Set-PVSafeFileCategory`    |
| DELETESAFEFILECATEGORY | `Remove-PVSafeFileCategory` |
| RETRIEVEPASSWORDOBJECT | `Get-PVPasswordObject`      |

</details>

<details>
<summary><b>Folders and files</b></summary>

| PACLI command         | Function                   |
| --------------------- | -------------------------- |
| FOLDERSLIST           | `Get-PVFolder`             |
| ADDFOLDER             | `New-PVFolder`             |
| MOVEFOLDER            | `Move-PVFolder`            |
| DELETEFOLDER          | `Remove-PVFolder`          |
| UNDELETEFOLDER        | `Restore-PVFolder`         |
| ADDPREFERREDFOLDER    | `Add-PVPreferredFolder`    |
| DELETEPREFERREDFOLDER | `Remove-PVPreferredFolder` |
| FILESLIST             | `Get-PVFileList`           |
| FILEVERSIONSLIST      | `Get-PVFileVersionList`    |
| FINDFILES             | `Find-PVFile`              |
| STOREFILE             | `Add-PVFile`               |
| RETRIEVEFILE          | `Get-PVFile`               |
| STOREPASSWORDOBJECT   | `Add-PVPasswordObject`     |
| MOVEFILE              | `Move-PVFile`              |
| DELETEFILE            | `Remove-PVFile`            |
| UNDELETEFILE          | `Restore-PVFile`           |
| RESETFILE             | `Reset-PVFile`             |
| LOCKFILE              | `Lock-PVFile`              |
| UNLOCKFILE            | `Unlock-PVFile`            |
| INSPECTFILE           | `Get-PVFileActivity`       |
| VALIDATEOBJECT        | `Set-PVObjectValidation`   |
| LISTFILECATEGORIES    | `Get-PVFileCategory`       |
| ADDFILECATEGORY       | `Add-PVFileCategory`       |
| UPDATEFILECATEGORY    | `Set-PVFileCategory`       |
| DELETEFILECATEGORY    | `Remove-PVFileCategory`    |
| RULESLIST             | `Get-PVRule`               |
| ADDRULE               | `Add-PVRule`               |
| DELETERULE            | `Remove-PVRule`            |

</details>

<details>
<summary><b>Users and groups</b></summary>

| PACLI command               | Function               |
| --------------------------- | ---------------------- |
| USERSLIST                   | `Get-PVUserList`       |
| USERDETAILS                 | `Get-PVUser`           |
| ADDUSER                     | `New-PVUser`           |
| UPDATEUSER                  | `Set-PVUser`           |
| RENAMEUSER                  | `Rename-PVUser`        |
| DELETEUSER                  | `Remove-PVUser`        |
| LOCK                        | `Lock-PVUser`          |
| UNLOCK                      | `Unlock-PVUser`        |
| SETPASSWORD                 | `Set-PVUserPassword`   |
| INSPECTUSER                 | `Get-PVUserActivity`   |
| CLEARUSERHISTORY            | `Clear-PVUserHistory`  |
| GETUSERPHOTO                | `Get-PVUserPhoto`      |
| PUTUSERPHOTO                | `Set-PVUserPhoto`      |
| MAILUSER                    | `Send-PVMailMessage`   |
| ADDUPDATEEXTERNALUSERENTITY | `Add-PVExternalUser`   |
| ADDSAFESHARE                | `Add-PVSafeGWAccount`  |
| DELETESAFESHARE             | `Remove-PVSafeGWAccount` |
| GROUPDETAILS                | `Get-PVGroup`          |
| ADDGROUP                    | `New-PVGroup`          |
| UPDATEGROUP                 | `Set-PVGroup`          |
| DELETEGROUP                 | `Remove-PVGroup`       |
| GROUPMEMBERS                | `Get-PVGroupMember`    |
| ADDGROUPMEMBER              | `Add-PVGroupMember`    |
| DELETEGROUPMEMBER           | `Remove-PVGroupMember` |
| LOCATIONSLIST               | `Get-PVLocation`       |
| ADDLOCATION                 | `New-PVLocation`       |
| UPDATELOCATION              | `Set-PVLocation`       |
| RENAMELOCATION              | `Rename-PVLocation`    |
| DELETELOCATION              | `Remove-PVLocation`    |
| LDAPBRANCHESLIST            | `Get-PVLDAPBranch`     |
| LDAPBRANCHADD               | `New-PVLDAPBranch`     |
| LDAPBRANCHUPDATE            | `Set-PVLDAPBranch`     |
| LDAPBRANCHDELETE            | `Remove-PVLDAPBranch`  |

</details>

<details>
<summary><b>Network areas</b></summary>

| PACLI command                | Function                       |
| ---------------------------- | ------------------------------ |
| NETWORKAREASLIST             | `Get-PVNetworkArea`            |
| ADDNETWORKAREA               | `New-PVNetworkArea`            |
| MOVENETWORKAREA              | `Move-PVNetworkArea`           |
| RENAMENETWORKAREA            | `Rename-PVNetworkArea`         |
| DELETENETWORKAREA            | `Remove-PVNetworkArea`         |
| ADDAREAADDRESS               | `New-PVNetworkAreaAddress`     |
| DELETEAREAADDRESS            | `Remove-PVNetworkAreaAddress`  |
| TRUSTEDNETWORKAREASLIST      | `Get-PVTrustedNetworkArea`     |
| ADDTRUSTEDNETWORKAREA        | `Add-PVTrustedNetworkArea`     |
| ACTIVATETRUSTEDNETWORKAREA   | `Enable-PVTrustedNetworkArea`  |
| DEACTIVATETRUSTEDNETWORKAREA | `Disable-PVTrustedNetworkArea` |
| DELETETRUSTEDNETWORKAREA     | `Remove-PVTrustedNetworkArea`  |

</details>

<details>
<summary><b>Requests and passwords</b></summary>

| PACLI command             | Function              |
| ------------------------- | --------------------- |
| REQUESTSLIST              | `Get-PVRequest`       |
| REQUESTCONFIRMATIONSTATUS | `Get-PVRequestStatus` |
| CONFIRMREQUEST            | `Set-PVRequestStatus` |
| DELETEREQUEST             | `Remove-PVRequest`    |
| GENERATEPASSWORD          | `New-PVPassword`      |

</details>

## Changelog

Notable changes are recorded in the [Changelog](CHANGELOG.md).

## Author

- **Pete Maan** - [pspete](https://github.com/pspete)

## License

MIT. See [LICENSE.md](LICENSE.md).

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).
