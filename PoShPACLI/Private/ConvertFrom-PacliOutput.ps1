Function ConvertFrom-PacliOutput {

	<#
	.SYNOPSIS
	Converts the quote enclosed, comma separated string returned by certain
	PACLI commands to unquoted string values contained in an array.

	.DESCRIPTION
	The PACLI executable returns raw string data from certain functions.
	Passing the output through this function allows the  values to be
	extracted from the string and returned in an array for further processing.

	.PARAMETER pacliOutput
	The string Returned from the PACLI executable.

	PACLI commands which return output should be called with the 'ENCLOSE'
	output option to ensure all values are enclosed in quotation marks.

	All whitespace should be removed from the PACLI output via a
	Select-String -Pattern "\S" pattern match in order to prevent blank lines
	in the PACLI output affecting the number of property values returned by
	this function.

	.PARAMETER regEx
	A Regular Expression String. This is applied to the quoted output from
	the PACLI function to extract the quoted values from the string.

	The default Regular Expression used is: '"(.*?)"(?=,|$)'

	.EXAMPLE
	foreach ($pacliLine in $pacliOutPut){

		$returnValues = $pacliLine | ConvertFrom-PacliOutput

	}

	Outputs an array containing the returned property values for each line
	of PACLI output passed to this function.

	.EXAMPLE
	$Results = ($Return.StdOut | ConvertFrom-PacliOutput)

	Converts StdOut of PACLI output

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True, ValueFromPipeline = $True)]
		[string]$pacliOutput,

		[Parameter(
			Mandatory = $False, ValueFromPipeline = $False)]
		[string]$regEx = '"(.*?)"(?=,|$)'
	)

	Begin { }

	Process {

		(($pacliOutput | Select-String -Pattern "\S") -split "\r\n" | Select-String -Pattern $regEx -AllMatches).Matches.Groups.Where( { $PSItem.Name -eq 1 }).Value

	}

	End { }

}
