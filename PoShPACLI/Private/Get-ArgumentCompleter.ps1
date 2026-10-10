function Get-ArgumentCompleter {

	<#
	.SYNOPSIS
	Builds an argument completer scriptblock backed by a module command.

	.DESCRIPTION
	Returns a scriptblock suitable for Register-ArgumentCompleter.
	When invoked by the completion engine, the retrieval scriptblock is run in the module scope.
	No PACLI command is run unless a vault user is set in the module scope.
	Errors are suppressed so tab completion fails silently.

	.PARAMETER RetrievalCommand
	Scriptblock returning candidate objects.

	.PARAMETER ValueProperty
	Name of the property on the returned objects holding the value to complete.

	.PARAMETER ToolTipProperty
	Optional name of a property to include in the tooltip.

	.EXAMPLE
	Register-ArgumentCompleter -CommandName Open-PVSafe -ParameterName safe -ScriptBlock (
		Get-ArgumentCompleter -RetrievalCommand { Get-PVSafeList } -ValueProperty Safename -ToolTipProperty Location
	)

	Completes safe names for the safe parameter of Open-PVSafe.

	#>
	[CmdletBinding()]
	[OutputType([scriptblock])]
	[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '', Justification = 'Captured by GetNewClosure')]
	param(

		[Parameter(
			Mandatory = $True)]
		[scriptblock]$RetrievalCommand,

		[Parameter(
			Mandatory = $True)]
		[string]$ValueProperty,

		[Parameter(
			Mandatory = $False)]
		[string]$ToolTipProperty

	)

	{
		param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

		$null = $parameterName, $commandAst, $fakeBoundParameters

		try {

			$Module = (Get-Command $commandName -ErrorAction Stop).Module

			& $Module {
				param($Retrieval, $ValueProperty, $ToolTipProperty, $Word)

				if (-not $Script:PV.user) { return }

				$ErrorActionPreference = 'Stop'

				& $Retrieval | Get-CompletionResult -WordToComplete $Word -ValueProperty $ValueProperty -ToolTipProperty $ToolTipProperty

			} $RetrievalCommand $ValueProperty $ToolTipProperty $wordToComplete

		} catch { return }

	}.GetNewClosure()

}
