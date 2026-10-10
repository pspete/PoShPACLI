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
#Register argument completers
$Completers = @(
	@{
		Parameter = 'safe', 'safeName'
		Exclude   = 'New-PVSafe'
		Retrieval = { Get-PVSafeList }
		Value     = 'Safename'
		ToolTip   = 'Location'
	}
	@{
		Parameter = 'destUser', 'owner', 'member', 'trusterName'
		Exclude   = 'New-PVUser', 'Add-PVExternalUser'
		Retrieval = { Get-PVUserList }
		Value     = 'Username'
		ToolTip   = 'Type'
	}
	@{
		Parameter = 'group'
		Exclude   = 'New-PVGroup'
		Retrieval = { Get-PVUserList | Where-Object Type -EQ 'GROUP' }
		Value     = 'Username'
		ToolTip   = 'Location'
	}
	@{
		Parameter = 'location'
		Exclude   = 'New-PVLocation'
		Retrieval = { Get-PVLocation }
		Value     = 'Location'
	}
	@{
		Parameter = 'networkArea'
		Exclude   = 'New-PVNetworkArea'
		Retrieval = { Get-PVNetworkArea }
		Value     = 'NetworkArea'
		ToolTip   = 'SecurityLevel'
	}
)

$Commands = Get-ChildItem $PSScriptRoot\Functions -Recurse -Include '*.ps1' | ForEach-Object { Get-Command -Name $_.BaseName }

foreach ($Completer in $Completers) {

	$ScriptBlock = Get-ArgumentCompleter -RetrievalCommand $Completer.Retrieval -ValueProperty $Completer.Value -ToolTipProperty $Completer.ToolTip

	foreach ($Parameter in $Completer.Parameter) {

		$CommandName = $Commands | Where-Object { ($_.Parameters.Keys -contains $Parameter) -and ($Completer.Exclude -notcontains $_.Name) } |
			Select-Object -ExpandProperty Name

		if ($CommandName) {
			Register-ArgumentCompleter -CommandName $CommandName -ParameterName $Parameter -ScriptBlock $ScriptBlock
		}

	}

}
