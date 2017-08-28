Function Set-PVSafeOwner {

	<#
	.SYNOPSIS
		Updates the Safe Owner authorizations of a particular Safe Owner.
		In order to carry out this command successfully, the Safe must be open.

	.DESCRIPTION
		Exposes the PACLI Function: "UPDATEOWNER"

	.PARAMETER vault
		The name of the Vault to which the Safe Owner has access.

	.PARAMETER user
		The Username of the User carrying out the task

	.PARAMETER owner
		The name of the Safe Owner whose authorizations will be updated

	.PARAMETER safe
		The name of the Safe in which the Safe Owner's authorizations apply.

	.PARAMETER readOnlyByDefault
		Whether or not the user’s initial access to the files in the Safe is for
		read-only format.

	.PARAMETER retrieve
		Whether or not the Safe Owner will be able to retrieve files.

	.PARAMETER store
		Whether or not the Safe Owner will be able to store files.

	.PARAMETER delete
		Whether or not the Safe Owner will be able to delete files.

	.PARAMETER administer
		Whether or not the Safe Owner will be able to administer the Safe.

	.PARAMETER supervise
		Whether or not the Safe Owner will be able to supervise other Safe Owners
		and confirm requests by other users to enter specific Safes.

	.PARAMETER backup
		Whether or not the Safe Owner will be able to backup the Safe.

	.PARAMETER manageOwners
		Whether or not the Safe Owner will be able to manage other Safe Owners.

	.PARAMETER accessNoConfirmation
		Whether or not the Safe Owner will be able to access the Safe without
		requiring confirmation from authorized users.

	.PARAMETER validateSafeContent
		Whether or not the Safe Owner will be able to change the validation status
		of the Safe contents.

	.PARAMETER list
		Whether or not the Safe Owner will be able to list Safe contents

	.PARAMETER usePassword
		Whether or not the Safe Owner will be able to use the password in the PVWA.

	.PARAMETER updateObjectProperties
		Whether or not the Safe Owner will be able to update object properties.

	.PARAMETER initiateCPMChange
		Whether or not the Safe Owner will be able to initiate CPM changes for
		passwords.

	.PARAMETER initiateCPMChangeWithManualPassword
		Whether or not the Safe Owner will be able to initiate a CPM change with
		a manual password.

	.PARAMETER createFolder
		Whether or not the Safe Owner will be able to create folders.

	.PARAMETER deleteFolder
		Whether or not the Safe Owner will be able to delete folders.

	.PARAMETER moveFrom
		Whether or not the Safe Owner will be able to move objects from their
		existing locations.

	.PARAMETER moveInto
		Whether or not the Safe Owner will be able to move objects into new
		locations.

	.PARAMETER viewAudit
		Whether or not the Safe Owner will be able to view other users’ audits.

	.PARAMETER viewPermissions
		Whether or not the Safe Owner will be able to view permissions of other
		users.

	.PARAMETER eventsList
		Whether or not the Safe Owner will be able to list events.
		Note: To allow Safe Owners to access the Safe, make sure this is set to YES.

	.PARAMETER addEvents
		Whether or not the Safe Owner will be able to add events.

	.PARAMETER createObject
		Whether or not the Safe Owner will be able to create new objects.

	.PARAMETER unlockObject
		Whether or not the Safe Owner will be able to unlock objects.

	.PARAMETER renameObject
		Whether or not the Safe Owner will be able to rename objects.

	.PARAMETER sessionID
		The ID number of the session. Use this parameter when working
		with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
		Set-PVSafeOwner -vault lab -user administrator -owner magnus -safe VIP -manageOwners:$false

		Remove manageOwners right from user magnus on safe VIP

	.NOTES
		AUTHOR: Pete Maan
		LASTEDIT: August 2017
	#>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][Alias("Username")][String]$owner,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][Alias("Safename")][String]$safe,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$readOnlyByDefault,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$retrieve,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$store,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$delete,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$administer,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$supervise,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$backup,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$manageOwners,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$accessNoConfirmation,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$validateSafeContent,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$list,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$usePassword,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$updateObjectProperties,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$initiateCPMChange,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$initiateCPMChangeWithManualPassword,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$createFolder,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$deleteFolder,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$moveFrom,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$moveInto,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$viewAudit,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$viewPermissions,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$eventsList,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$addEvents,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$createObject,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$unlockObject,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $False)][switch]$renameObject,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli UPDATEOWNER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Owner $owner Updated on Safe $safe"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}