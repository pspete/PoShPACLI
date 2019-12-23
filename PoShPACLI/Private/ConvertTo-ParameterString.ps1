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

	.PARAMETER excludedParameters
	Array of parameters, of which the names and values should not be included in the
	output string.

	By default this contains all PowerShell common , and optional common Parameters

	Common Parameters may be contained in the array passed to this function, and must
	be excluded from the output as they will not be interpreted by the PACLI utility
	and will therefore result in an error.

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
		[array]$excludedParameters = @([System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters),

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
		
		#define array to hold parameters
		$parameters = [System.Collections.ArrayList]@()
		$doNotQuote += "sessionID"
		$ValueTerminators = '^|$'
		$ValueTrue = '"True"'
		$ValueFalse = '"False"'
		
	}

	Process {

		$Keys = @($boundParameters.Keys)

		# Remove elements matching excludedParameters
		$keys | ForEach-Object {

			if ($excludedParameters -contains $_) {
				
				$boundParameters.Remove($_)

			}

		}

		#foreach element in passed array
		$boundParameters.GetEnumerator() | ForEach-Object {
			
			switch ($_) {

				( { $doNotQuote -NotContains $PSItem.Key }) { $value = $($PSItem.Key) + "=" + $(((($PSItem.Value).Replace($ValueTerminators, '"')).Replace($ValueTrue, "Yes")).Replace($ValueFalse, "No")) ; break }
				
				( { $doNotQuote -Contains $PSItem.Key }) { $value = $($PSItem.Key) + "=" + $($PSItem.Value) ; break }
				
			}

			$null = $parameters.Add($value)

		}
		
		If (-not ($NoSessionID.IsPresent)) {
			$null = $parameters.Add("sessionID=" + $($Script:PV.sessionID))
		}
		If (-not ($NoVault.IsPresent)) {
			$null = $parameters.Add("vault=" + '"' + $($Script:PV.vault) + '"')
		}
		If (-not ($NoUser.IsPresent)) {
			$null = $parameters.Add("user=" + '"' + $($Script:PV.user) + '"')
		}

	}

	End {

		#output parameter string
		$parameters -join ' '

	}

}