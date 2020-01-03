Function Get-PVSafeActivity {

	<#
	.SYNOPSIS
	Produces a list of activities of all the Safe Owners of the specified
	Safe(s).

	.DESCRIPTION
	Exposes the PACLI Function: "INSPECTSAFE"

	.PARAMETER safePattern
	The full name or part of the name of the Safe(s) to include in the report.
	Alternatively, a wildcard can be used in this parameter.
	The default is ‘*’ (wildcard).

	.PARAMETER userPattern
	The full name or part of the name of the Owner(s) to include in the list.
	Alternatively, a wildcard can be used in this parameter.

	.PARAMETER logdays
	The number of days to include in the list of activities.
	The default is ‘-1’, meaning that all the days registered in the log will be included.

	.PARAMETER alertsOnly
	Whether or not the activities list will contain only alerts or every activity.
	The default is ‘NO’.

	.PARAMETER fileName
	The full path name of the file where the log records will be saved.

	.PARAMETER codes
	The message codes that will be used to filter the log activities.
	Multiple codes are separated by commas.

	.PARAMETER fromDate
	The first day to be included in the list of activities.
	Use the following date format: dd/mm/yyyy.

	.PARAMETER toDate
	The last day to be included in the list of activities.
	Use the following date format: dd/mm/yyyy.

	.PARAMETER requestID
	The unique ID of a request in the list of activities.

	.PARAMETER categoriesNames
	The name of the categories to include in the list.

	Separate multiple category names with the value of the
	CATEGORIESSEPERATOR parameter.

	Specify a corresponding value for each category name in the
	CATEGORIESVALUE parameter.

	.PARAMETER categoriesValues
	The value of each category specified in the CATEGORIESNAMES parameter.

	Separate multiple category names with the value of the
	CATEGORIESSEPERATOR parameter.

	Specify a corresponding value for each category in the
	CATEGORIESNAME parameter.

	.PARAMETER categoriesSeperator
	The separator between multiple category names and multiple category values.
	The default is ‘,’ (comma).

	.PARAMETER categoryFilterType
	The type of category filter. Possible values are:
	AND – Categories will be filtered according to all the
	specified filters.
	OR – Categories will be filtered according to one of the
	specified categories.
	The default is ‘AND’.

	.PARAMETER maxRecords
	The maximum number of records to retrieve.

	.PARAMETER userType
	The user type to use to filter activities.

	.PARAMETER options
	The INSPECTSAFE options.
	Possible values are:
	1 – Returns the results in descending order.
	2 – Indicates the user pattern is in regular expression.
	4 – Uses negation for user pattern regular expression.
	16 – Displays only an external audit.
	32 – Displays only an internal audit.
	64 – Sort according to external time.
	128 – The user pattern is the exact string, not a wildcard
	or regular expression.
	256 – Shows system audit.

	.EXAMPLE
	Get-PVSafeActivity -safePattern unix_safe -userPattern *

	Gets safe activity for all users from safe unix_safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safePattern,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$userPattern,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$logdays,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$alertsOnly,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fileName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$codes,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[datetime]$fromDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[datetime]$toDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$requestID,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$categoriesNames,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$categoriesValues,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$categoriesSeperator,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("OR", "AND")]
		[string]$categoryFilterType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$maxRecords,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$userType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet("1", "2", "4", "16", "32", "64", "128", "256")]
		[int]$options
	)

	PROCESS {

		("fromDate", "toDate") | ForEach-Object {

			if ($PSBoundParameters.ContainsKey($_)) {

				$PSBoundParameters[$_] = (Get-Date $($PSBoundParameters[$_]) -Format dd/MM/yyyy)

			}

		}

		$Return = Invoke-PACLICommand $Script:PV.ClientPath INSPECTSAFE "$($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote logdays,categoryFilterType,maxRecords,options) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 9) {

					#Get Range from array
					$values = $Results[$i..($i + 9)]

					#Output Object
					[PSCustomObject] @{

						"Time"          = $values[0]
						"Username"      = $values[1]
						"Safe"          = $values[2]
						"Activity"      = $values[3]
						"Location"      = $values[4]
						"NewLocation"   = $values[5]
						"RequestID"     = $values[6]
						"RequestReason" = $values[7]
						"Code"          = $values[8]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Activity

				}

			}

		}

	}

}