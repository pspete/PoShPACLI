Function New-PVPassword {

	<#
	.SYNOPSIS
	Generates a password automatically according to the built-in password
	policy, and the user-specified policy.

	.DESCRIPTION
	Exposes the PACLI Function: "GENERATEPASSWORD"
	The built-in policy ensures the following:
	Numbers will not occur in the password edges
	Repeated characters or sequences are not allowed
	The user-specified policy enables the user to control the parameters
	that are specified in this command

	.PARAMETER length
	The length of the password.

	.PARAMETER minUpperCase
	The minimum number of uppercase characters to be included
	in the password. Specify ‘-1’ to exclude uppercase characters
	from the password.

	.PARAMETER minSpecial
	The minimum number of special characters to be included in
	the password. Specify ‘-1’ to exclude special characters from
	the password.

	.PARAMETER minLowerCase
	The minimum number of lowercase characters to be included
	in the password. Specify ‘-1’ to exclude lowercase characters
	from the password.

	.PARAMETER minDigit
	The minimum number of numeric characters to be included in
	the password. Specify ‘-1’ to exclude digits from the
	password.

	.PARAMETER effectiveLength
	The number of characters from the beginning of the password
	that the above 4 parameters apply to.

	.PARAMETER forbiddenChars
	A list of characters that will not be included in the password.
	These characters do not have separators, but must be inside
	quotation marks, eg., “/?\”

	.EXAMPLE
	New-PVPassword -length 19 -minUpperCase 8 -minSpecial 3 -minLowerCase 6 `
	-minDigit 1 -forbiddenChars xyz

	Generates a new password as per the parameters

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateRange(1, 170)]
		[int]$length,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$minUpperCase,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$minSpecial,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$minLowerCase,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$minDigit,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$effectiveLength,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$forbiddenChars
	)

	$Return = Invoke-PACLICommand $Script:PV.ClientPath GENERATEPASSWORD "$($PSBoundParameters |
            ConvertTo-ParameterString -donotQuote length,minUpperCase,minSpecial,minLowerCase,
                minDigit,effectiveLength) OUTPUT (ALL)"

	if ($Return.ExitCode -eq 0) {

		#if result(s) returned
		if ($Return.StdOut) {

			#Return Generated Password String
			[PSCustomObject] @{

				"Password" = $Return.StdOut.TrimEnd()

			}

		}

	}

}