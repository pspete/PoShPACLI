Function Set-PVSafeOwner {

	<#
	.SYNOPSIS
	Updates the Safe Owner authorizations of a particular Safe Owner.
	In order to carry out this command successfully, the Safe must be open.

	.DESCRIPTION
	Exposes the PACLI Function: "UPDATEOWNER"

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

	.EXAMPLE
	Set-PVSafeOwner -owner magnus -safe VIP -manageOwners:$false

	Remove manageOwners right from user magnus on safe VIP

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[String]$owner,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[String]$safe,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$readOnlyByDefault,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$retrieve,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$store,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$delete,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$administer,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$supervise,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$backup,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$manageOwners,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$accessNoConfirmation,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$validateSafeContent,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$list,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$usePassword,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$updateObjectProperties,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$initiateCPMChange,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$initiateCPMChangeWithManualPassword,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$createFolder,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$deleteFolder,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$moveFrom,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$moveInto,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$viewAudit,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$viewPermissions,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$eventsList,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$addEvents,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$createObject,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$unlockObject,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$renameObject
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath UPDATEOWNER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}