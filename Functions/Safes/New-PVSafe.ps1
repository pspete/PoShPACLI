Function New-PVSafe {

	<#
	.SYNOPSIS
		Adds a Safe. Via the parameters, declare which Vault the Safe will be in,
		the size of the Safe, and the file history that the Safe will retain.

	.DESCRIPTION
		Exposes the PACLI Function: "ADDSAFE"

	.PARAMETER vault
		The Vault to which the Safe will be added

	.PARAMETER user
		The Username of the User who is adding the Safe

	.PARAMETER safe
		The name of the Safe to be added.

	.PARAMETER location
		The location in which to add the Safe.
		Note: Add a backslash ‘\’ before the name of the location.

	.PARAMETER size
		The size in MB of the Safe to add

	.PARAMETER description
		A description of the Safe.

	.PARAMETER fromHour
		The time from which Users can access the Safe.

	.PARAMETER toHour
		The time until which Users can access the Safe.

	.PARAMETER delay
		The delay in minutes between the User opening the Safe and the Vault
		permitting access to it.

	.PARAMETER dailyVersions
		The number of daily versions of files to be retained.

	.PARAMETER monthlyVersions
		The number of monthly versions of files to be retained.

	.PARAMETER yearlyVersions
		The number of yearly versions of files to be retained.

	.PARAMETER logRetention
		The number of days that must pass before log files can be completely
		deleted from the Safe.

	.PARAMETER fileRetention
		The number of days that must pass before files (other than log files)
		in the Safe can be completely deleted.

	.PARAMETER requestsRetention
		The number of days that must pass before requests can be completely deleted
		from the Safe.

	.PARAMETER textOnly
		Indicates whether or not the Safe is a text-only Safe.

	.PARAMETER securityLevelParm
		The level of the Network Area security flags

	.PARAMETER ConfirmationType
		The type of confirmation required to enable access to the Safe.
		Possible values for this parameter are:
			1 – No confirmation is needed (default)
			2 – Confirmation is needed to open the Safe
			3 – Confirmation is needed to retrieve files
			4 – Confirmation is needed to open the Safe and retrieve files
				and passwords

		Note: When the value of this parameter is set to ‘0’ (zero), the value of
		‘confirmationcount’ will also be set to ‘0’ (zero) automatically instead
		of to the default value.

	.PARAMETER confirmationCount
		The number of authorized Safe Owners required to confirm the users request to access
		the Safe.
		0–64 – The number of authorized Owners that need to confirm (default=1)
		255 – All authorized Owners need to confirm

	.PARAMETER alwaysNeedsConfirmation
		Whether or not all Owners require confirmation to access the Safe.

		No – Confirmation is needed only if the request is from an Owner who is unauthorized
		to confirm requests.
		Yes – All Owners need confirmation, even Owners who are authorized to confirm
		requests (default).

		Note: This parameter can only be used when working with version 2.50 of the CyberArk
		Vault.

	.PARAMETER safeKeyType
		The type of encryption used to encrypt the contents of the Safe.
		Possible values are:
			1 – BasicKeyType
			2 – PassKeyType
			3 – FileKeyType
			4 – NoKeyType (during transmission)

	.PARAMETER safeKey
		The pathname of the key file used to encrypt the contents of the Safe if the value of
		‘safekeytype’ is ‘2’ or ‘3’.

	.PARAMETER password
		The password required to encrypt the contents of the Safe if the value of ‘safekeytype’
		is ‘2’ or ‘3’.

	.PARAMETER keyFilePath
		The pathname of the key required to encrypt the contents of the Safe if the value of
		‘safekeytype’ is ‘3’.

	.PARAMETER getNewFileAccessMark
		New files will be marked so they can be identified.

	.PARAMETER getRetrievedFileAccessMark
		Retrieved files will be marked so they can be identified.

	.PARAMETER getModifiedFileAccessMark
		Modified files will be marked so they can be identified.

	.PARAMETER readOnlyByDefault
		New owners of this Safe will initially retrieve in readonly access mode.

	.PARAMETER safeOptions
		This parameter enables to Safe to be shared with the following values or
		combination of them:
		64 – Enable access to partially impersonated users
		128 – Enable access to fully impersonated users
		512 – Enable access to impersonated users with additional Vault authentication
		256 – Enforce Safe opening.

		Note: This is combined with a value of 64 in order to allow access to partially
		impersonated users.

	.PARAMETER useFileCategories
		Whether or not to use Vault level file categories when storing a file in a Safe

	.PARAMETER requireReason
		Whether or not a user is required to supply a reason before files and password
		content can be retrieved from this Safe.

	.PARAMETER enforceExclusivePasswords
		Whether or not the Safe will enforce exclusive passwords mode.

	.PARAMETER requireContentValidation
		Whether or not files and passwords in this Safe must be validated before they
		can be accessed

	.PARAMETER maxFileSize
		The maximum size of files stored in the Safe in KB.
		The default is ‘0’ which indicates no maximum file size.

	.PARAMETER allowedFileTypes
		Indicates which file types are accepted in this Safe.

		Possible file types are:
		DOC, DOT, XLS, XLT, EPS, BMP, GIF, TGA, TIF, TIFF, LOG, TXT, PAL.

	.PARAMETER supportOLAC
		Whether or not Object Level Access is supported.
		The default is ‘No’.

	.PARAMETER sessionID
		The ID number of the session. Use this parameter when working
		with multiple scripts simultaneously. The default is ‘0’.

	.EXAMPLE
		New-PVSafe -vault Lab -user administrator -safe PacliSafe `
		-location \ -size 50 -description "new Safe" -dailyVersions 5 -logRetention 40

		Creates safe "PacliSafe", in the root location, with size, daily versions & log retention set

	.NOTES
		AUTHOR: Pete Maan
		LASTEDIT: August 2017
	#>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $False)][string]$location,
		[Parameter(Mandatory = $False)][int]$size,
		[Parameter(Mandatory = $False)][string]$description,
		[Parameter(Mandatory = $False)][int]$fromHour,
		[Parameter(Mandatory = $False)][int]$toHour,
		[Parameter(Mandatory = $False)][int]$delay,
		[Parameter(Mandatory = $False)][int]$dailyVersions,
		[Parameter(Mandatory = $False)][int]$monthlyVersions,
		[Parameter(Mandatory = $False)][int]$yearlyVersions,
		[Parameter(Mandatory = $False)][int]$logRetention,
		[Parameter(Mandatory = $False)][int]$fileRetention,
		[Parameter(Mandatory = $False)][int]$requestsRetention,
		#[Parameter(Mandatory=$False)][switch]$virusFree,
		[Parameter(Mandatory = $False)][switch]$textOnly,
		[Parameter(Mandatory = $False)][int]$securityLevelParm,
		[Parameter(Mandatory = $False)][ValidateSet("1", "2", "3", "4")][int]$ConfirmationType,
		[Parameter(Mandatory = $False)]
		[ValidateScript( {((($_ -ge 0) -and ($_ -le 64)) -or ($_ -eq 255))})]
		[int]$confirmationCount,
		[Parameter(Mandatory = $False)][switch]$alwaysNeedsConfirmation,
		[Parameter(Mandatory = $False)][ValidateSet("1", "2", "3", "4")][int]$safeKeyType,
		[Parameter(Mandatory = $False)][string]$safeKey,
		[Parameter(Mandatory = $False)][securestring]$password,
		[Parameter(Mandatory = $False)][string]$keyFilePath,
		[Parameter(Mandatory = $False)][switch]$getNewFileAccessMark,
		[Parameter(Mandatory = $False)][switch]$getRetrievedFileAccessMark,
		[Parameter(Mandatory = $False)][switch]$getModifiedFileAccessMark,
		[Parameter(Mandatory = $False)][switch]$readOnlyByDefault,
		[Parameter(Mandatory = $False)][ValidateSet("64", "128", "512", "256", "192", "576", "320", "640", "384", "768", "704", "448", "832", "896", "960")][int]$safeOptions,
		[Parameter(Mandatory = $False)][switch]$useFileCategories,
		[Parameter(Mandatory = $False)][switch]$requireReason,
		[Parameter(Mandatory = $False)][switch]$enforceExclusivePasswords,
		[Parameter(Mandatory = $False)][switch]$requireContentValidation,
		[Parameter(Mandatory = $False)][int]$maxFileSize,
		[Parameter(Mandatory = $False)][string]$allowedFileTypes,
		[Parameter(Mandatory = $False)][switch]$supportOLAC,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		#deal with password SecureString
		if($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		$Return = Invoke-PACLICommand $pacli ADDSAFE $($PSBoundParameters.getEnumerator() |

			ConvertTo-ParameterString -donotQuote size, fromHour, toHour, delay,
			dailyVersions, monthlyVersions, yearlyVersions, logRetention,
			fileRetention, requestsRetention, securityLevelParm, ConfirmationType,
			confirmationCount, safeKeyType, safeOptions, maxFileSize)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Safe Created: $safe"

		}

	}

}