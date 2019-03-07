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

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

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
			ValueFromPipelineByPropertyName = $False)]
		[ValidateRange(1, 170)]
		[int]$length,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[int]$minUpperCase,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[int]$minSpecial,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[int]$minLowerCase,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[int]$minDigit,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[int]$effectiveLength,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[string]$forbiddenChars,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	If(Test-PACLI) {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli GENERATEPASSWORD "$($PSBoundParameters.getEnumerator() |
            ConvertTo-ParameterString -donotQuote length,minUpperCase,minSpecial,minLowerCase,
                minDigit,effectiveLength) OUTPUT (ALL)"

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				Write-Verbose "Password Generated"

				#Return Generated Password String
				[PSCustomObject] @{

					"Password" = $Return.StdOut.TrimEnd()

				}

			}

		}

	}

}