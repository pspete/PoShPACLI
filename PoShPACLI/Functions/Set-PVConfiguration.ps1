Function Set-PVConfiguration {
	<#
	.SYNOPSIS
	Sets a variable in the script scope which holds default values for PACLI operations.
	Must be run prior to other module functions if path to PACLI has not been previously set.

	.DESCRIPTION
	Sets properties on an object which is set as the value of a variable in the script scope.
	The created variable can be queried and used by other module functions to provide default values.
	Creates a file in the logged on users home folder named PV_Configuration.xml. This file contains the variable
	used by the module, and will be imported with the module.

	.PARAMETER ClientPath
	The path to the PACLI.exe utility

	.PARAMETER sessionID
	The sessionID value to use for PACLI Commands

	.PARAMETER vault
	The value to use for the vault parameter in PACLI Commands

	.PARAMETER user
	The value to use for the user parameter in PACLI commands

	.EXAMPLE
	Set-PVConfiguration -ClientPath D:\Path\To\PACLI.exe

	Sets default path to PACLI to D:\Path\To\PACLI.exe.
	This is accessed via the variable property $Script:PV.ClientPath
	Creates C:\users\user\PV_Configuration.xml file to hold values for persistence.

	#>
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

	Begin {

		$Defaults = [pscustomobject]@{ }

	}

	Process {

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

	End { }

}