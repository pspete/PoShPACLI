# .ExternalHelp PoShPACLI-help.xml
function New-PVPassword {

	[CmdletBinding(SupportsShouldProcess)]
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

	process {

		$Return = Invoke-PACLICommand -PacliCommand GENERATEPASSWORD -CommandParameters "$($PSBoundParameters |
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

}
