function ConvertFrom-PacliOutput {

	<#
	.SYNOPSIS
	Converts the quote enclosed, comma separated string returned by certain
	PACLI commands to arrays of unquoted string values, one array per record.

	.DESCRIPTION
	The PACLI executable returns raw string data from certain functions.
	Passing the output through this function allows the values to be
	extracted from the string and returned for further processing.

	Each record returned by PACLI is output as a single string array.
	Records are delimited by a closing quote, a line break and an opening quote.
	Values are delimited by "," so values containing line breaks or quotes
	are preserved.

	Records which are not quote enclosed are ignored.

	.PARAMETER pacliOutput
	The string Returned from the PACLI executable.

	PACLI commands which return output should be called with the 'ENCLOSE'
	output option to ensure all values are enclosed in quotation marks.

	.EXAMPLE
	$Results = @($Return.StdOut | ConvertFrom-PacliOutput)

	foreach ($values in $Results) {

		$values[0]

	}

	Outputs the first property value of each record in the PACLI output.

	.EXAMPLE
	$Return.StdOut | ConvertFrom-PacliOutput | Select-Object -First 1

	Outputs the property values of the first record in the PACLI output.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdletBinding()]
	[OutputType('System.String[]')]
	param(

		[Parameter(
			Mandatory = $True, ValueFromPipeline = $True)]
		[string]$pacliOutput
	)


	process {

		$pacliOutput.Trim() -split '(?<=")\s*[\r\n]+\s*(?=")' |
			Where-Object { $PSItem -match '(?s)^".*"$' } |
			ForEach-Object {

				, [string[]]($PSItem.Substring(1, $PSItem.Length - 2) -split '","')

			}

	}


}