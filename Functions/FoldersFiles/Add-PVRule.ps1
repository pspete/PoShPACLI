Function Add-PVRule {

	<#
	.SYNOPSIS
		Adds an Object Level Access rule

	.DESCRIPTION
		Exposes the PACLI Function: "ADDRULE"

	.PARAMETER vault
		The name of the Vault.

	.PARAMETER user
		The Username of the User who is logged on.

	.PARAMETER userName
		The user who will be affected by the rule.

	.PARAMETER safeName
	The Safe where the rule is applied.

	.PARAMETER fullObjectName
		The file, password, or folder that the rule applies to.

	.PARAMETER isFolder
		Whether the rule applies to files and passwords or for
		folders.
			NO – Indicates files and passwords
			YES – Indicates folders

	.PARAMETER effect
		Whether or not the rule allows or denies the user
		authorizations that are specified in the following parameters.
		Possible values are:
			Allow – The rule enables the authorizations marked ‘YES’.
			Deny – The rule denies all the following permissions.

	.PARAMETER retrieve
		Whether or not the user is authorized to retrieve files.

	.PARAMETER store
		Whether or not the user is authorized to store files.

	.PARAMETER delete
		Whether or not the user is authorized to delete files.

	.PARAMETER administer
		Whether or not the user is authorized to administer the Safe.

	.PARAMETER supervise
		Whether or not the user is authorized to supervise other Safe
		Owners and confirm requests by other users to enter specific
		Safes

	.PARAMETER backup
		Whether or not the user is authorized to backup the Safe

	.PARAMETER manageOwners
		Whether or not the user is authorized to manage other Safe
		owners.

	.PARAMETER accessNoConfirmation
		Whether or not the user is authorized to access the Safe
		without receiving confirmation from authorized users.

	.PARAMETER validateSafeContent
		Whether or not the user is authorized to validate the Safe
		contents.

	.PARAMETER list
		Whether or not the user is authorized to list the specified file,
		password, or folder.

	.PARAMETER usePassword
		If the object is a password, whether or not the user can use
		the password via the PVWA.

	.PARAMETER updateObjectProperties
		Whether or not the user is authorized to update the specified
		file or password categories.

	.PARAMETER initiateCPMChange
		Whether or not the user is authorized to initiate a CPM
		change for the specified password.

	.PARAMETER initiateCPMChangeWithManualPassword
		Whether or not the user is authorized to initiate a CPM
		change with a manual password for the specified password.

	.PARAMETER createFolder
		Whether or not the user is authorized to create a new folder.

	.PARAMETER deleteFolder
		Whether or not the user is authorized to delete a folder.

	.PARAMETER moveFrom
		Whether or not the user is authorized to move the specified
		file or password from its current location.

	.PARAMETER moveInto
		Whether or not the user is authorized to move the specified
		file or password into a different location.

	.PARAMETER viewAudit
		Whether or not the user is authorized to view the specified
		file or password audits.

	.PARAMETER viewPermissions
		Whether or not the user is authorized to view the specified
		file or password permissions.

	.PARAMETER eventsList
		Whether or not the user is authorized to view events.

		Note: To allow Safe Owners to access the Safe, make sure
		this is set to YES.

	.PARAMETER addEvents
		Whether or not the user is authorized to add events.

	.PARAMETER createObject
		Whether or not the user is authorized to create a new file or
		password.

	.PARAMETER unlockObject
		Whether or not the user is authorized to unlock the specified
		file or password.

	.PARAMETER renameObject
		Whether or not the user is authorized to rename the
		specified file or password.

	.PARAMETER sessionID
		The ID number of the session. Use this parameter when working
		with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
		Add-PVRule -vault lab -user administrator -userName user1 -safeName DEV-1 -fullObjectName root\rootpass -effect Allow -retrieve -store -delete

		Adds rule on object rootpass safe DEV-1 fr user user1

	.NOTES
		AUTHOR: Pete Maan
		LASTEDIT: August 2017
	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$userName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$safeName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fullObjectName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$isFolder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[ValidateSet("Allow", "Deny")]
		[string]$effect,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$retrieve,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$store,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$delete,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$administer,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$supervise,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$backup,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$manageOwners,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$accessNoConfirmation,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$validateSafeContent,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$list,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$usePassword,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$updateObjectProperties,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$initiateCPMChange,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$initiateCPMChangeWithManualPassword,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$createFolder,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$deleteFolder,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$moveFrom,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$moveInto,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$viewAudit,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$viewPermissions,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$eventsList,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$addEvents,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$createObject,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$unlockObject,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$renameObject,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDRULE "$($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString -donotQuote effect) OUTPUT (ALL,ENCLOSE)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#loop through results
				For($i = 0 ; $i -lt $Results.length ; $i += 7) {

					#Get Range from array
					$values = $Results[$i..($i + 7)]

					#Output Object
					[PSCustomObject] @{

						"RuleID"           = $values[0]
						"UserName"         = $values[1]
						"Safename"         = $values[2]
						"FullObjectName"   = $values[3]
						"Effect"           = $values[4]
						"RuleCreationDate" = $values[5]
						"AccessLevel"      = $values[6]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Rule -PropertyToAdd @{
						"vault"     = $vault
						"user"      = $user
						"sessionID" = $sessionID
					}

				}

			}

		}

	}

}