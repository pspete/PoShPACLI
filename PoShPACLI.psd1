@{

	# Script module or binary module file associated with this manifest.
	RootModule        = 'PoShPACLI.psm1'

	# Version number of this module.
	ModuleVersion     = '0.0.05'

	# ID used to uniquely identify this module
	GUID              = '194c227f-87bf-43af-b401-4a34bd8e2ac6'

	# Author of this module
	Author            = 'Pete Maan'

	# Company or vendor of this module
	# CompanyName = ''

	# Copyright statement for this module
	Copyright         = '(c) 2017 Pete Maan. All rights reserved.'

	# Description of the functionality provided by this module
	Description       = 'PowerShell wrapper exposing CyberArk PACLI commandline utility functionality'

	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '3.0'

	# Name of the Windows PowerShell host required by this module
	# PowerShellHostName = ''

	# Minimum version of the Windows PowerShell host required by this module
	# PowerShellHostVersion = ''

	# Minimum version of Microsoft .NET Framework required by this module
	# DotNetFrameworkVersion = ''

	# Minimum version of the common language runtime (CLR) required by this module
	# CLRVersion = ''

	# Processor architecture (None, X86, Amd64) required by this module
	# ProcessorArchitecture = ''

	# Modules that must be imported into the global environment prior to importing this module
	# RequiredModules = @()

	# Assemblies that must be loaded prior to importing this module
	# RequiredAssemblies = @()

	# Script files (.ps1) that are run in the caller's environment prior to importing this module.
	# ScriptsToProcess = @()

	# Type files (.ps1xml) to be loaded when importing this module
	# TypesToProcess = @()

	# Format files (.ps1xml) to be loaded when importing this module
	#FormatsToProcess = @('')


	# Functions to export from this module
	FunctionsToExport = @(
		'Initialize-PoShPACLI',
		'Start-Pacli', #INIT
		'Stop-Pacli', #TERM
		'Add-VaultDefinition', #DEFINE
		'Read-VaultConfigFile', #DEFINEFROMFILE
		'Remove-VaultDefinition', #DELETEVAULT
		'Connect-Vault', #LOGON
		'New-LogonFile', #CREATELOGONFILE
		'Disconnect-Vault', #LOGOFF
		'Set-Password', #SETPASSWORD
		'Lock-User', #LOCK
		'Unlock-User', #UNLOCK
		'Add-User', #ADDUSER
		'Update-User', #UPDATEUSER
		'Rename-User', #RENAMEUSER
		'Remove-User', #DELETEUSER
		'Add-ExternalUser', #ADDUPDATEEXTERNALUSERENTITY
		'Get-UserDetails', #USERDETAILS
		'Get-VaultUsers', #USERSLIST
		'Get-UserActivity', #INSPECTUSER
		'Get-SafesLog', #SAFESLOG
		'Clear-UserHistory', #CLEARUSERHISTORY
		'Set-UserPhoto', #PUTUSERPHOTO
		'Get-UserPhoto', #GETUSERPHOTO
		'Send-PAMailMessage', #MAILUSER
		'Add-SafeShare', #ADDSAFESHARE
		'Remove-SafeShare', #DELETESAFESHARE
		'Add-Group', #ADDGROUP
		'Update-Group', #UPDATEGROUP
		'Remove-Group', #DELETEGROUP
		'Add-GroupMember', #ADDGROUPMEMBER
		'Remove-GroupMember', #DELETEGROUPMEMBER
		'Add-Location', #ADDLOCATION
		'Update-Location', #UPDATELOCATION
		'Rename-Location', #RENAMELOCATION
		'Remove-Location', #DELETELOCATION
		'Get-Locations', #LOCATIONSLIST
		'Get-GroupDetails', #GROUPDETAILS
		'Get-GroupMembers', #GROUPMEMBERS
		'Add-LDAPBranch', #LDAPBRANCHADD
		'Update-LDAPBranch', #LDAPBRANCHUPDATE
		'Remove-LDAPBranch', #LDAPBRANCHDELETE
		'Get-LDAPBranches', #LDAPBRANCHESLIST
		'Add-NetworkArea', #ADDNETWORKAREA
		'Remove-NetworkArea', #DELETENETWORKAREA
		'Move-NetworkArea', #MOVENETWORKAREA
		'Rename-NetworkArea', #RENAMENETWORKAREA
		'Get-NetworkArea', #NETWORKAREASLIST
		'Add-AreaAddress', #ADDAREAADDRESS
		'Remove-AreaAddress', #DELETEAREAADDRESS
		'Add-TrustedNetworkArea', #ADDTRUSTEDNETWORKAREA
		'Remove-TrustedNetworkArea', #DELETETRUSTEDNETWORKAREA
		'Get-TrustedNetworkArea', #TRUSTEDNETWORKAREALIST
		'Enable-TrustedNetworkArea', #ACTIVATETRUSTEDNETWORKAREA
		'Disable-TrustedNetworkArea', #DEACTIVATETRUSTEDNETWORKAREA
		'Open-Safe', #OPENSAFE
		'Close-Safe', #CLOSESAFE
		'Add-Safe', #ADDSAFE
		'Update-Safe', #UPDATESAFE
		'Rename-Safe', #RENAMESAFE
		'Remove-Safe', #DELETESAFE
		'Add-SafeOwner', #ADDOWNER
		'Update-SafeOwner', #UPDATEOWNER
		'Remove-SafeOwner', #DELETEOWNER
		'Get-OwnerSafes', #OWNERSAFESLIST
		'Get-SafeDetails', #SAFEDETAILS
		'Get-Safe', #SAFESLIST
		'Get-SafeOwners', #OWNERSLIST
		'Get-SafeActivity', #INSPECTSAFE
		'Add-SafeFileCategory', #ADDSAFEFILECATEGORY
		'Update-SafeFileCategory', #UPDATESAFEFILECATEGORY
		'Remove-SafeFileCategory', #DELETESAFEFILECATEGORY
		'Get-SafeFileCategory', #LISTSAFEFILECATEGORIES
		'Add-SafeEvent', #ADDEVENT
		'Get-SafeEvents', #SAFEEVENTSLIST
		'Add-SafeNote', #ADDNOTE
		'Reset-Safe', #RESETSAFE
		'Clear-SafeHistory', #CLEARSAFEHISTORY
		'Add-Folder', #ADDFOLDER
		'Remove-Folder', #DELETEFOLDER
		'Restore-Folder', #UNDELETEFOLDER
		'Move-Folder', #MOVEFOLDER
		'Get-Folder', #FOLDERSLIST
		'Add-PreferredFolder', #ADDPREFERREDFOLDER
		'Remove-PreferredFolder', #DELETEPREFFEREDFOLDER
		'Add-File', #STOREFILE
		'Get-File', #RETRIEVEFILE
		'Remove-File', #DELETEFILE
		'Restore-File', #UNDELETEFILE
		'Add-PasswordObject', #STOREPASSWORDOBJECT
		'Get-PasswordObject', #RETRIEVEPASSWORDOBJECT
		'Lock-File', #LOCKFILE
		'Unlock-File', #UNLOCKFILE
		'Move-File', #MOVEFILE
		'Search-Files', #FINDFILES
		'Get-FilesList', #FILESLIST
		'Get-FileversionsList', #FILEVERSIONSLIST
		'Reset-File', #RESETFILE
		'Get-FileActivity', #INSPECTFILE
		'Add-FileCategory', #ADDFILECATEGORY
		'Update-FileCategory', #UPDATEFILECATEGORY
		'Remove-FileCategory', #DELETEFILECATEGORY
		'Get-FileCategories', #LISTFILECATEGORIES
		'Confirm-Object', #VALIDATEOBJECT
		'Get-HttpGwUrl', #GETHTTPGWURL
		'Add-Rule', #ADDRULE
		'Remove-Rule', #DELETERULE
		'Get-RulesList', #RULESLIST
		'Get-RequestsList', #REQUESTSLIST
		'Confirm-Request', #CONFIRMREQUEST
		'Remove-Request', #DELETEREQUEST
		'Get-RequestConfirmationStatus', #REQUESTCONFIRMATIONSTATUS
		'New-Password', #GENERATEPASSWORD
		'Get-CtlFileName', #CTLGETFILENAME
		'Add-CTLCert', #CTLADDCERT
		'Remove-CTLCert', #CTLREMOVECERT
		'Get-CtlList', #CTLLIST
		'New-Password', #GENERATEPASSWORD
		'Get-CtlFileName', #CTLGETFILENAME
		'Add-CTLCert', #CTLADDCERT
		'Remove-CTLCert', #CTLREMOVECERT
		'Get-CtlList'                   #CTLLIST
	)

	# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData       = @{

		PSData = @{

			# Tags applied to this module. These help with module discovery in online galleries.
			Tags       = @('CyberArk', 'PACLI', 'CLI Wrapper')

			# A URL to the license for this module.
			LicenseUri = 'https://github.com/pspete/PoShPACLI/blob/master/LICENSE.md'

			# A URL to the main website for this project.
			ProjectUri = 'https://github.com/pspete/PoShPACLI'

			# A URL to an icon representing this module.
			# IconUri = ''

			# ReleaseNotes of this module
			# ReleaseNotes = ''

		} # End of PSData hashtable

	} # End of PrivateData hashtable

}