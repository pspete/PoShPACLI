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
    	The bound parameter object from a PowerShell function.

    .PARAMETER doNotQuote
        Optional parameterNames that will be included int he output without "quotes"

    .PARAMETER excludedParameters
        Array of parameters, of which the names and values should not be included in the
        output string.

        By default this contains all PowerShell Common Parameter Names:
            Debug
            ErrorAction
            ErrorVariable
            OutVariable
            OutBuffer
            PipelineVariable
            Verbose
            WarningAction
            WarningVariable
            WhatIf
            Confirm

        Common Parameters may be contained in the array passed to this function, and must
        be excluded from the output as they will not be interpreted by the PACLI utility
        and will therefore result in an error.

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
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True, ValueFromPipeline = $True)]
		[array]$boundParameters,

		[Parameter(
			Mandatory = $False, ValueFromPipeline = $False)]
		[array]$doNotQuote,

		[Parameter(
			Mandatory = $False, ValueFromPipeline = $False)]
		[array]$excludedParameters = @(
			"Debug", "ErrorAction", "ErrorVariable", "OutVariable", "OutBuffer", "PipelineVariable",
			"Verbose", "WarningAction", "WarningVariable", "WhatIf", "Confirm")
	)

	Begin {

		write-debug "Processing Bound Parameters"
		#define array to hold parameters
		$parameters = @()

		#Ensure sessionID is never enclosed in quotes
		if($doNotQuote -notcontains "sessionID") {

			$doNotQuote += "sessionID"

		}

	}

	Process {

		#foreach element in passed array
		$boundParameters | ForEach-Object {

			If(($excludedParameters -notContains $_.key) -and ($doNotQuote -notContains $_.key)) {

				#add key=value to array, process switch values to equate TRUE=Yes, FALSE=No
				#Quote Parameter Value so Key="Value"
				$parameters += $($_.Key) + "=" + (((($($_.Value) -replace '^', '"') `
								-replace '$', '"') `
							-replace '"True"', 'YES') `
						-replace '"False"', 'NO') `
					#boolean values YES/NO should never be "in quotes"
			}

			If(($excludedParameters -notContains $_.key) -and ($doNotQuote -Contains $_.key)) {

				#add key=value to array, process switch values to equate TRUE=Yes, FALSE=No
				$parameters += $($_.Key) + "=" + $($_.Value)

			}

		}

	}

	End {

		if($parameters) {

			$parameters = $parameters -join ' '

			write-debug $parameters
			#output parameter string
			$parameters

		}

	}

}