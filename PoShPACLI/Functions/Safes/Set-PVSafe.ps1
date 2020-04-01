Function Set-PVSafe {

	<#
	.SYNOPSIS
	Updates Safe properties

	.DESCRIPTION
	Exposes the PACLI Function: "UPDATESAFE"

	.PARAMETER safe
	The name of the Safe to update.

	.PARAMETER location
	The location of the Safe in the Vault hierarchy.
	Note: Add a backslash ‘\’ before the name of the location.

	.PARAMETER size
	The maximum size of the Safe in MB.

	.PARAMETER description
	A description of the Safe.

	.PARAMETER fromHour
	The time from which Users can access the Safe.

	.PARAMETER toHour
	The time until which Users can access the Safe.

	.PARAMETER delay
	The delay in seconds between when the User opens the Safe and the Vault
	permits access

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

	.PARAMETER safeFilter
	Specifies the type of Safe content filter.
	Possible values are:
	None – the Safe will be a regular Safe and will not have any content filter.
	TextOnlyFilter – the Safe will only store text files.

	Note:
	Text Only Safes can be changed into regular Safes, but a regular Safe cannot become
	a filtered Safe.

	.PARAMETER safeOptions
	This parameter enables to Safe to be shared with any combination of the following values:
	PartiallyImpersonatedUsers (Enable access to partially impersonated users)
	FullyImpersonatedUsers (Enable access to fully impersonated users)
	ImpersonatedUsers (Enable access to impersonated users with additional Vault authentication)
	EnforceSafeOpening (Enforce Safe opening from PrivateArk Client)

	.PARAMETER securityLevelParm
	Specify the Network Area security flags.
	Valid values are combinations of the following:
	Locations: Internal, External, Public.
	Security Areas: HighlySecured, Secured, Unsecured

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

	.PARAMETER alwaysNeedConfirmation
	Whether or not all Owners require confirmation to access the Safe.

	No – Confirmation is needed only if the request is from an Owner who is unauthorized
	to confirm requests.
	Yes – All Owners need confirmation, even Owners who are authorized to confirm
	requests (default).

	Note: This parameter can only be used when working with version 2.50 of the CyberArk
	Vault.

	.PARAMETER getNewFileAccessMark
	New files will be marked so they can be identified.

	.PARAMETER getRetrievedFileAccessMark
	Retrieved files will be marked so they can be identified.

	.PARAMETER getModifiedFileAccessMark
	Modified files will be marked so they can be identified.

	.PARAMETER readOnlyByDefault
	New owners of this Safe will initially retrieve in readonly access mode.

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

	.EXAMPLE
	Set-PVSafe -safe DEV -size 100

	Sets size of 100Mb on DEV safe

	.EXAMPLE
	Set-PVSafe -safe SomeSafe -securityLevelParm Internal, HighlySecured -safeOptions FullyImpersonatedUsers, ImpersonatedUsers, PartiallyImpersonatedUsers

	Update safe "SomeSafe" with declared security flags & Safe sharing options.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$size,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$description,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$fromHour,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$toHour,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$delay,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$dailyVersions,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$monthlyVersions,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$yearlyVersions,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$logRetention,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$fileRetention,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$requestsRetention,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("None", "TextOnlyFilter")]
		[string]$safeFilter,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[SafeOptions]$safeOptions,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[SecurityLevel]$securityLevelParm,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("1", "2", "3", "4")]
		[int]$confirmationType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateScript( { ((($_ -ge 0) -and ($_ -le 64)) -or ($_ -eq 255)) })]
		[int]$confirmationCount,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$alwaysNeedConfirmation,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$getNewFileAccessMark,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$getRetrievedFileAccessMark,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$getModifiedFileAccessMark,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$readOnlyByDefault,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$useFileCategories,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$requireReason,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$enforceExclusivePasswords,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$requireContentValidation,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$maxFileSize,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$allowedFileTypes
	)

	PROCESS {

		Switch ([array]$PSBoundParameters.Keys) {

			{ $_ -Contains "securityLevelParm" } { $PSBoundParameters["securityLevelParm"] = [int]$securityLevelParm; continue }

			{ $_ -Contains "safeOptions" } { $PSBoundParameters["safeOptions"] = [int]$safeOptions; continue }

		}

		$Null = Invoke-PACLICommand $Script:PV.ClientPath UPDATESAFE $($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote size, fromHour, toHour, delay, dailyVersions,
			monthlyVersions, yearlyVersions, logRetention, fileRetention, requestsRetention,
			safeOptions, securityLevelParm, confirmationCount, maxFileSize)



	}

}