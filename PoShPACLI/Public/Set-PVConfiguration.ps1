# .ExternalHelp PoShPACLI-help.xml
function Set-PVConfiguration {

	[CmdletBinding(SupportsShouldProcess)]
	Param(
		[Parameter(
			Mandatory = $false,
			ValueFromPipelineByPropertyName = $true
		)]
		[ValidateScript( { Test-Path $_ -PathType Leaf })]
		[ValidateNotNullOrEmpty()]
		[string]$ClientPath,

		[Parameter(
			Mandatory = $false,
			ValueFromPipelineByPropertyName = $true)]
		[int]$sessionID,

		[Parameter(
			Mandatory = $false,
			ValueFromPipelineByPropertyName = $true)]
		[string]$vault,

		[Parameter(
			Mandatory = $false,
			ValueFromPipelineByPropertyName = $true)]
		[string]$user

	)

	begin {

		$Defaults = [pscustomobject]@{ }

	}

	process {

		If ($PSBoundParameters.Keys -notcontains "ClientPath") {

			$ClientPath = $Script:PV.ClientPath

		}
		Else {

			[System.Version]$ClientVersion = Get-Item $ClientPath | Select-Object -ExpandProperty VersionInfo | Select-Object -ExpandProperty ProductVersion
			If ($ClientVersion -lt [System.Version]"7.2") {
				Throw "PACLI version 7.2 or higher required"
			}

		}

		If ($PSBoundParameters.Keys -notcontains "sessionID") {

			$sessionID = $Script:PV.sessionID

		}

		If ($PSBoundParameters.Keys -notcontains "vault") {

			$vault = $Script:PV.vault

		}

		If ($PSBoundParameters.Keys -notcontains "user") {

			$user = $Script:PV.user

		}

		$Defaults | Add-Member -MemberType NoteProperty -Name ClientPath -Value $ClientPath
		$Defaults | Add-Member -MemberType NoteProperty -Name sessionID -Value $sessionID
		$Defaults | Add-Member -MemberType NoteProperty -Name vault -Value $vault
		$Defaults | Add-Member -MemberType NoteProperty -Name user -Value $user

		Set-Variable -Name PV -Value $Defaults -Scope Script

		$Script:PV | Select-Object -Property * | Export-Clixml -Path "$env:HOMEDRIVE$env:HomePath\PV_Configuration.xml" -Force

	}


}