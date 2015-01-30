# PoShPACLI
Powershell PACLI Module
Exposes the native functions of the PACLI command line utility.

PACLI executable must be present on the computer on which the module is to be imported. 

Save the PoShPACLI.psm1 file in a folder with the same name in your modules folder. 

To view the paths that are specified as module folders, type the following command: $env:PSModulePath

To find the module on your local system, issue command: Get-Module -ListAvailable

To import the module into your session, use command: Import-Module PoShPACLI

After the module has been imported, you can use the Get-Command cmdlet with the –module parameter to see which commands are exported by the module: Get-Command -Module PoShPACLI

Function Initialize-PoShPACLI must be run before working with the other module functions.
This is required to locate the PACLI execuatable in the SYSTEM path, or in a folder you specify, in order for the module to be able to execute the utility.

The below list shows the native PACLI function to PoShPACLI function relationship:

INIT: Start-Pacli

TERM: Stop-Pacli

DEFINE: Add-VaultDefinition

DEFINEFROMFILE: Read-VaultConfigFile

DELETEVAULT: Remove-VaultDefinition

LOGON: Connect-Vault

CREATELOGONFILE: New-LogonFile

LOGOFF: Disconnect-Vault

SETPASSWORD: Set-Password

LOCK: Lock-User

UNLOCK: Unlock-User

ADDUSER: Add-User

UPDATEUSER: Update-User

RENAMEUSER: Rename-User

DELETEUSER: Remove-User

ADDUPDATEEXTERNALUSERENTITY: Add-ExternalUser

USERDETAILS: Get-UserDetails

USERSLIST: Get-VaultUsers

INSPECTUSER: Get-UserActivity

SAFESLOG: Get-SafesLog

CLEARUSERHISTORY: Clear-UserHistory

PUTUSERPHOTO: Set-UserPhoto

GETUSERPHOTO: Get-UserPhoto

MAILUSER: Send-PAMailMessage

ADDSAFESHARE: Add-SafeShare

DELETESAFESHARE: Remove-SafeShare

ADDGROUP: Add-Group

UPDATEGROUP: Update-Group

DELETEGROUP: Remove-Group

ADDGROUPMEMBER: Add-GroupMamber

DELETEGROUPMEMBER: Remove-GroupMamber

ADDLOCATION: Add-Location

UPDATELOCATION: Update-Location

RENAMELOCATION: Rename-Location

DELETELOCATION: Remove-Location

LOCATIONSLIST: Get-Locations

GROUPDETAILS: Get-GroupDetails

GROUPMEMBERS: Get-GroupMembers

LDAPBRANCHADD: Add-LDAPBranch

LDAPBRANCHUPDATE: Update-LDAPBranch

LDAPBRANCHDELETE: Remove-LDAPBranch

LDAPBRANCHESLIST: Get-LDAPBranches

ADDNETWORKAREA: Add-NetworkArea

DELETENETWORKAREA: Remove-NetworkArea

MOVENETWORKAREA: Move-NetworkArea

RENAMENETWORKAREA: RenameNetworkArea

NETWORKAREASLIST: Get-NetworkArea

ADDAREAADDRESS: Add-AreaAddress

DELETEAREAADDRESS: Remove-AreaAddress

ADDTRUSTEDNETWORKAREA: Add-TrustedNetworkArea

DELETETRUSTEDNETWORKAREA: Remove-TrustedNetworkArea

TRUSTEDNETWORKAREALIST: Get-TrustedNetworkArea

ACTIVATETRUSTEDNETWORKAREA: Enable-TrustedNetworkArea

DEACTIVATETRUSTEDNETWORKAREA: Disable-TrustedNetworkArea

OPENSAFE: Open-Safe

CLOSESAFE: Close-Safe

ADDSAFE: Add-Safe

UPDATESAFE: Update-Safe

RENAMESAFE: Rename-Safe

DELETESAFE: Remove-Safe

ADDOWNER: Add-SafeOwner

UPDATEOWNER: Update-SafeOwner

DELETEOWNER: Remove-SafeOwner

OWNERSAFESLIST: Get-OwnerSafes

SAFEDETAILS: Get-SafeDetails

SAFESLIST: Get-Safe

OWNERSLIST: Get-SafeOwners

INSPECTSAFE: Get-SafeActivity

ADDSAFEFILECATEGORY: Add-SafeFileCategory

UPDATESAFEFILECATEGORY: Update-SafeFileCategory

DELETESAFEFILECATEGORY: Remove-SafeFileCategory

LISTSAFEFILECATEGORIES: Get-SafeFileCategory

ADDEVENT: Add-SafeEvent

SAFEEVENTSLIST: Get-SafeEvents

ADDNOTE: Add-SafeNote

RESETSAFE: Reset-Safe

CLEARSAFEHISTORY: Clear-SafeHistory

ADDFOLDER: Add-Folder

DELETEFOLDER: Remove-Folder

UNDELETEFOLDER: RestoreFolder

MOVEFOLDER: Move-Folder

FOLDERSLIST: Get-Folder

ADDPREFERREDFOLDER: Add-PreferredFolder

DELETEPREFFEREDFOLDER: Remove-PreferredFolder

STOREFILE: Add-File

RETRIEVEFILE: Get-File

DELETEFILE: Remove-File

UNDELETEFILE: Restore-File

STOREPASSWORDOBJECT: Add-PasswordObject

RETRIEVEPASSWORDOBJECT: Get-PasswordObject

LOCKFILE: Lock-File

UNLOCKFILE: Unlock-File

MOVEFILE: Move-File

FINDFILES: Search-Files

FILESLIST: Get-FilesList

FILEVERSIONSLIST: Get-FileversionsList

RESETFILE: Reset-File

INSPECTFILE: Get-FileActivity

ADDFILECATEGORY: Add-FileCategory

UPDATEFILECATEGORY: Update-FileCategory

DELETEFILECATEGORY: Remove-FileCategory

LISTFILECATEGORIES: Get-FileCategories

VALIDATEOBJECT: Confirm-Object

GETHTTPGWURL: Get-HttpGwUrl

ADDRULE: Add-Rule

DELETERULE: Remove-Rule

RULESLIST: Get-RulesList

REQUESTSLIST: Get-RequestsList

CONFIRMREQUEST: Confirm-Request

DELETEREQUEST: Remove-Request

REQUESTCONFIRMATIONSTATUS: Get-RequestConfirmationStatus

GENERATEPASSWORD: New-Password

CTLGETFILENAME: Get-CtlFileName

CTLADDCERT: Add-CTLCert

CTLREMOVECERT: Remove-CTLCert

CTLLIST: Get-CtlList

GENERATEPASSWORD: New-Password

CTLGETFILENAME: Get-CtlFileName

CTLADDCERT: Add-CTLCert

CTLREMOVECERT: Remove-CTLCert

CTLLIST: Get-CtlList
