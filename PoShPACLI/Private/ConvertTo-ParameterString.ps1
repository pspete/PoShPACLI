Function ConvertTo-ParameterString {

	<#
	.SYNOPSIS
	Converts bound parameters from called functions to a quoted string formatted
	to be supplied to the PACLI command line tool

	.DESCRIPTION
	Allows values supplied against PowerShell function parameters to be easily
	translated into a specifically formatted string to be used to supply
	arguments to native PACLI functions.

	Common Parameters, like Verbose or Debug, which may be contained in the array
	passed to this function are excluded from the output by default as they will
	not be interpreted by the PACLI utility and will result in an error.

	.PARAMETER boundParameters
	The $PSBoundParameters object from a PowerShell function.

	.PARAMETER doNotQuote
	Optional parameterNames that will be included int he output without "quotes"

	.PARAMETER NoVault
	Specify switch parameter to not include vault parameter in output string

	.PARAMETER NoUser
	Specify switch parameter to not include user parameter in output string

	.PARAMETER NoSessionID
	Specify switch parameter to not include sessionID parameter in output string

	.EXAMPLE
	$PSBoundParameters.getEnumerator() | ConvertTo-ParameterString

	#Outputs a string where the Key/Value pairs contained in PSBoundParameters
	#are converted into KEY="VALUE"

	.EXAMPLE
	$PSBoundParameters.getEnumerator() | ConvertTo-ParameterString -DoNotQuote thisParameter

	#Outputs a string where the Key/Value pairs contained in PSBoundParameters
	#are converted into KEY="VALUE"
	#and Key/Value pair for parameter $thisParameter
	#is converted into KEY=VALUE

	.NOTES
	AUTHOR: Pete Maan

	#>
	[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', 'Parameters', Justification = "False Positive")]
	[CmdLetBinding()]
	[OutputType('System.String')]
	param(

		[Parameter(
			Mandatory = $True, ValueFromPipeline = $True)]
		[hashtable]$boundParameters,

		[Parameter(
			Mandatory = $False, ValueFromPipeline = $False)]
		[array]$doNotQuote,

		[Parameter(
			Mandatory = $False, ValueFromPipeline = $False)]
		[switch]$NoVault,

		[Parameter(
			Mandatory = $False, ValueFromPipeline = $False)]
		[switch]$NoUser,

		[Parameter(
			Mandatory = $False, ValueFromPipeline = $False)]
		[switch]$NoSessionID
	)

	Begin {

		$doNotQuote += "sessionID"
		$ValueTerminators = '^|$'
		$ValueTrue = '"True"'
		$ValueFalse = '"False"'

		$excludedParameters = [Collections.Generic.List[String]]@(
			[System.Management.Automation.PSCmdlet]::CommonParameters +
			[System.Management.Automation.PSCmdlet]::OptionalCommonParameters
		)

	}

	Process {

		$boundParameters.Keys | ForEach-Object {

			#Create collection to hold parameters
			$Parameters = [Collections.Generic.List[String]]@()

		} {

			switch ($PSItem) {

				( { $excludedParameters -Contains $PSItem }) { break }

				( { $doNotQuote -NotContains $PSItem }) {

					$null = $Parameters.Add($($PSItem) + "=" + $(((($($boundParameters[$PSItem]) -replace $ValueTerminators, '"').ToString()).Replace($ValueTrue, "Yes")).Replace($ValueFalse, "No")))
					break

				}

				( { $doNotQuote -Contains $PSItem }) {

					$null = $Parameters.Add($($PSItem) + "=" + $($boundParameters[$PSItem]))
					break

				}

			}

		} {

			If ((-not ($NoSessionID.IsPresent)) -and $($Script:PV.sessionID)) {
				$null = $Parameters.Add("sessionID=" + $($Script:PV.sessionID))
			}
			If ((-not ($NoVault.IsPresent)) -and $($Script:PV.vault)) {
				$null = $Parameters.Add("vault=" + '"' + $($Script:PV.vault) + '"')
			}
			If ((-not ($NoUser.IsPresent)) -and $($Script:PV.user)) {
				$null = $Parameters.Add("user=" + '"' + $($Script:PV.user) + '"')
			}

		}

	}

	End {

		#output parameter string
		$Parameters -join ' '

	}

}