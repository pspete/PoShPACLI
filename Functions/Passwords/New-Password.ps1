Function New-Password {

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
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)]
		[ValidateRange(1, 170)][int]$length,
		[Parameter(Mandatory = $False)][int]$minUpperCase,
		[Parameter(Mandatory = $False)][int]$minSpecial,
		[Parameter(Mandatory = $False)][int]$minLowerCase,
		[Parameter(Mandatory = $False)][int]$minDigit,
		[Parameter(Mandatory = $False)][int]$effectiveLength,
		[Parameter(Mandatory = $False)][string]$forbiddenChars,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli GENERATEPASSWORD "$($PSBoundParameters.getEnumerator() |
            ConvertTo-ParameterString -donotQuote length,minUpperCase,minSpecial,minLowerCase,
                minDigit,effectiveLength) OUTPUT (ALL)"

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			Write-Verbose "Error Generating Password"
			$FALSE

		}

		else {

			#if result(s) returned
			if($Return.StdOut) {

				Write-Verbose "Password Generated"
				Write-Debug $Return.StdOut
				#Convert Output to array
				#$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)
				$Results = ($Return.StdOut | Select-String -Pattern "\S")
				#Return Generated Password String
				[PSCustomObject] @{

					"Password" = $Return.StdOut

				}

			}

		}

	}

}