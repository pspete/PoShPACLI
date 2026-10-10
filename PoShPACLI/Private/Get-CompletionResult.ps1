function Get-CompletionResult {

	<#
	.SYNOPSIS
	Converts objects returned by a module command into argument completion results.

	.DESCRIPTION
	Shared filtering and formatting for the module's argument completers.
	Emits one CompletionResult for each input object where the value of the specified
	property starts with the word being completed (case-insensitive).
	A leading backslash on the value is optional, so location paths match by name.
	Values containing whitespace or special characters are single quoted.

	.PARAMETER InputObject
	Objects returned by the module command.

	.PARAMETER WordToComplete
	The partial value supplied by the completion engine.

	.PARAMETER ValueProperty
	Name of the property holding the value to complete.

	.PARAMETER ToolTipProperty
	Optional name of a property to include in the tooltip.

	.EXAMPLE
	Get-PVSafeList | Get-CompletionResult -WordToComplete $wordToComplete -ValueProperty Safename -ToolTipProperty Location

	Returns completion results for safes whose name starts with $wordToComplete.

	#>
	[CmdletBinding()]
	[OutputType([System.Management.Automation.CompletionResult])]
	param(

		[Parameter(
			Mandatory = $False, ValueFromPipeline = $True)]
		[object[]]$InputObject,

		[Parameter(
			Mandatory = $False)]
		[string]$WordToComplete,

		[Parameter(
			Mandatory = $True)]
		[string]$ValueProperty,

		[Parameter(
			Mandatory = $False)]
		[string]$ToolTipProperty

	)

	begin {

		$Pattern = '{0}*' -f [WildcardPattern]::Escape("$WordToComplete".Trim("'`""))

	}

	process {

		foreach ($Item in $InputObject) {

			$Value = "$($Item.$ValueProperty)"

			if ((-not $Value) -or (($Value -notlike $Pattern) -and ($Value.TrimStart('\') -notlike $Pattern))) { continue }

			$CompletionText = if ($Value -match '[\s''"`$#;,(){}@&|<>]') { "'{0}'" -f ($Value -replace "'", "''") } else { $Value }

			$ToolTip = if ($ToolTipProperty -and $Item.$ToolTipProperty) { '{0} ({1})' -f $Value, $Item.$ToolTipProperty } else { $Value }

			[System.Management.Automation.CompletionResult]::new($CompletionText, $Value, 'ParameterValue', $ToolTip)

		}

	}

}
