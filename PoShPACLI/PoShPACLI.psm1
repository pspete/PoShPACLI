<#
.SYNOPSIS

.DESCRIPTION

.EXAMPLE

.INPUTS

.OUTPUTS

.NOTES

.LINK

#>
[CmdletBinding()]
param(

	[bool]$DotSourceModule = $false

)

#Get function files
Get-ChildItem $PSScriptRoot\ -Recurse -Include "*.ps1" |

ForEach-Object {

	if ($DotSourceModule) {
		. $_.FullName
	} else {
		$ExecutionContext.InvokeCommand.InvokeScript(
			$false,
			(
				[scriptblock]::Create(
					[io.file]::ReadAllText(
						$_.FullName,
						[Text.Encoding]::UTF8
					)
				)
			),
			$null,
			$null
		)

	}

}

#Read config and make available in script scope
$ConfigFile = "$env:HOMEDRIVE$env:HomePath\PV_Configuration.xml"

If(Test-Path $ConfigFile) {

	Write-Verbose "Importing Settings: $ConfigFile"

	$config = Import-Clixml -Path $ConfigFile

	Set-Variable -Name PV -Value $config -Scope Script

}