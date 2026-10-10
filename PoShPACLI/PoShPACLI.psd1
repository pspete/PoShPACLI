@{

	# Script module or binary module file associated with this manifest.
	RootModule        = 'PoShPACLI.psm1'

	# Version number of this module.
	ModuleVersion     = '2.1.27'

	# ID used to uniquely identify this module
	GUID              = '194c227f-87bf-43af-b401-4a34bd8e2ac6'

	# Author of this module
	Author            = 'Pete Maan'

	# Company or vendor of this module
	CompanyName       = 'PSPETE LTD'

	# Copyright statement for this module
	Copyright         = '(c) 2020 Pete Maan. All rights reserved.'

	# Description of the functionality provided by this module
	Description       = 'Invoke CyberArk PACLI.exe Utility Commands with PowerShell'

	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '5.0'

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
	TypesToProcess    = @('xml\PoShPACLI.Types.ps1xml')

	# Format files (.ps1xml) to be loaded when importing this module
	FormatsToProcess  = @('xml\PoShPACLI.Format.ps1xml')


	# Functions to export from this module
	FunctionsToExport = @(
		'Get-PVConfiguration',
		'Set-PVConfiguration',
		'Start-PVPacli', #INIT
		'Stop-PVPacli', #TERM
		'New-PVVaultDefinition', #DEFINE
		'Import-PVVaultDefinition', #DEFINEFROMFILE
		'Connect-PVVault', #LOGON
		'New-PVLogonFile', #CREATELOGONFILE
		'Disconnect-PVVault', #LOGOFF
		'Set-PVUserPassword', #SETPASSWORD
		'Lock-PVUser', #LOCK
		'Unlock-PVUser', #UNLOCK
		'New-PVUser', #ADDUSER
		'Set-PVUser', #UPDATEUSER
		'Rename-PVUser', #RENAMEUSER
		'Remove-PVUser', #DELETEUSER
		'Add-PVExternalUser', #ADDUPDATEEXTERNALUSERENTITY
		'Get-PVUser', #USERDETAILS
		'Get-PVUserList', #USERSLIST
		'Get-PVUserActivity', #INSPECTUSER
		'Get-PVSafeLog', #SAFESLOG
		'Clear-PVUserHistory', #CLEARUSERHISTORY
		'Set-PVUserPhoto', #PUTUSERPHOTO
		'Get-PVUserPhoto', #GETUSERPHOTO
		'Send-PVMailMessage', #MAILUSER
		'Add-PVSafeGWAccount', #ADDSAFESHARE
		'Remove-PVSafeGWAccount', #DELETESAFESHARE
		'New-PVGroup', #ADDGROUP
		'Set-PVGroup', #UPDATEGROUP
		'Remove-PVGroup', #DELETEGROUP
		'Add-PVGroupMember', #ADDGROUPMEMBER
		'Remove-PVGroupMember', #DELETEGROUPMEMBER
		'New-PVLocation', #ADDLOCATION
		'Set-PVLocation', #UPDATELOCATION
		'Rename-PVLocation', #RENAMELOCATION
		'Remove-PVLocation', #DELETELOCATION
		'Get-PVLocation', #LOCATIONSLIST
		'Get-PVGroup', #GROUPDETAILS
		'Get-PVGroupMember', #GROUPMEMBERS
		'New-PVLDAPBranch', #LDAPBRANCHADD
		'Set-PVLDAPBranch', #LDAPBRANCHUPDATE
		'Remove-PVLDAPBranch', #LDAPBRANCHDELETE
		'Get-PVLDAPBranch', #LDAPBRANCHESLIST
		'New-PVNetworkArea', #ADDNETWORKAREA
		'Remove-PVNetworkArea', #DELETENETWORKAREA
		'Move-PVNetworkArea', #MOVENETWORKAREA
		'Rename-PVNetworkArea', #RENAMENETWORKAREA
		'Get-PVNetworkArea', #NETWORKAREASLIST
		'New-PVNetworkAreaAddress', #ADDAREAADDRESS
		'Remove-PVNetworkAreaAddress', #DELETEAREAADDRESS
		'Add-PVTrustedNetworkArea', #ADDTRUSTEDNETWORKAREA
		'Remove-PVTrustedNetworkArea', #DELETETRUSTEDNETWORKAREA
		'Get-PVTrustedNetworkArea', #TRUSTEDNETWORKAREALIST
		'Enable-PVTrustedNetworkArea', #ACTIVATETRUSTEDNETWORKAREA
		'Disable-PVTrustedNetworkArea', #DEACTIVATETRUSTEDNETWORKAREA
		'Open-PVSafe', #OPENSAFE
		'Close-PVSafe', #CLOSESAFE
		'New-PVSafe', #ADDSAFE
		'Set-PVSafe', #UPDATESAFE
		'Rename-PVSafe', #RENAMESAFE
		'Remove-PVSafe', #DELETESAFE
		'Add-PVSafeOwner', #ADDOWNER
		'Set-PVSafeOwner', #UPDATEOWNER
		'Remove-PVSafeOwner', #DELETEOWNER
		'Get-PVUserSafeList', #OWNERSAFESLIST
		'Get-PVSafe', #SAFEDETAILS
		'Get-PVSafeList', #SAFESLIST
		'Get-PVSafeOwner', #OWNERSLIST
		'Get-PVSafeActivity', #INSPECTSAFE
		'New-PVSafeFileCategory', #ADDSAFEFILECATEGORY
		'Set-PVSafeFileCategory', #UPDATESAFEFILECATEGORY
		'Remove-PVSafeFileCategory', #DELETESAFEFILECATEGORY
		'Get-PVSafeFileCategory', #LISTSAFEFILECATEGORIES
		'Write-PVSafeEvent', #ADDEVENT
		'Get-PVSafeEvent', #SAFEEVENTSLIST
		'Set-PVSafeNote', #ADDNOTE
		'Reset-PVSafe', #RESETSAFE
		'Clear-PVSafeHistory', #CLEARSAFEHISTORY
		'New-PVFolder', #ADDFOLDER
		'Remove-PVFolder', #DELETEFOLDER
		'Restore-PVFolder', #UNDELETEFOLDER
		'Move-PVFolder', #MOVEFOLDER
		'Get-PVFolder', #FOLDERSLIST
		'Add-PVPreferredFolder', #ADDPREFERREDFOLDER
		'Remove-PVPreferredFolder', #DELETEPREFFEREDFOLDER
		'Add-PVFile', #STOREFILE
		'Get-PVFile', #RETRIEVEFILE
		'Remove-PVFile', #DELETEFILE
		'Restore-PVFile', #UNDELETEFILE
		'Add-PVPasswordObject', #STOREPASSWORDOBJECT
		'Get-PVPasswordObject', #RETRIEVEPASSWORDOBJECT
		'Lock-PVFile', #LOCKFILE
		'Unlock-PVFile', #UNLOCKFILE
		'Move-PVFile', #MOVEFILE
		'Find-PVFile', #FINDFILES
		'Get-PVFileList', #FILESLIST
		'Get-PVFileVersionList', #FILEVERSIONSLIST
		'Reset-PVFile', #RESETFILE
		'Get-PVFileActivity', #INSPECTFILE
		'Add-PVFileCategory', #ADDFILECATEGORY
		'Set-PVFileCategory', #UPDATEFILECATEGORY
		'Remove-PVFileCategory', #DELETEFILECATEGORY
		'Get-PVFileCategory', #LISTFILECATEGORIES
		'Set-PVObjectValidation', #VALIDATEOBJECT
		'Add-PVRule', #ADDRULE
		'Remove-PVRule', #DELETERULE
		'Get-PVRule', #RULESLIST
		'Get-PVRequest', #REQUESTSLIST
		'Set-PVRequestStatus', #CONFIRMREQUEST
		'Remove-PVRequest', #DELETEREQUEST
		'Get-PVRequestStatus', #REQUESTCONFIRMATIONSTATUS
		'New-PVPassword', #GENERATEPASSWORD
		'Get-PVCTL', #CTLGETFILENAME
		'Add-PVCTLCertificate', #CTLADDCERT
		'Remove-PVCTLCertificate', #CTLREMOVECERT
		'Get-PVCTLCertificate' #CTLLIST
	)

	# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData       = @{

		PSData = @{

			# Tags applied to this module. These help with module discovery in online galleries.
			Tags         = @('CyberArk', 'PACLI', 'Security')

			# A URL to the license for this module.
			LicenseUri   = 'https://github.com/pspete/PoShPACLI/blob/master/LICENSE.md'

			# A URL to the main website for this project.
			ProjectUri   = 'https://github.com/pspete/PoShPACLI'

			# A URL to an icon representing this module.
			# IconUri = ''

			# ReleaseNotes of this module
			ReleaseNotes = 'https://github.com/pspete/PoShPACLI/blob/master/CHANGELOG.md'

		} # End of PSData hashtable

	} # End of PrivateData hashtable

}
