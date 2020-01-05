<#
.SYNOPSIS
.DESCRIPTION
.EXAMPLE
.INPUTS
.OUTPUTS
#>
[CmdletBinding()]
param(

	[bool]$DotSourceModule = $false

)

#Network Area security flags enum
[Flags()]enum SecurityLevel{

	Internal = 1
	External = 2
	Public = 4
	HighlySecured = 8
	Secured = 16
	Unsecured = 32

}

#Safe Share Options enum
[Flags()]enum SafeOptions{

	PartiallyImpersonatedUsers = 64
	FullyImpersonatedUsers = 128
	ImpersonatedUsers = 512
	EnforceSafeOpening = 256

}

#Get function files
Get-ChildItem $PSScriptRoot\ -Recurse -Include "*.ps1" |

ForEach-Object {

	if ($DotSourceModule) {
		. $_.FullName
	}
 else {
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

If (Test-Path $ConfigFile) {

	$config = Import-Clixml -Path $ConfigFile

	Set-Variable -Name PV -Value $config -Scope Script

}