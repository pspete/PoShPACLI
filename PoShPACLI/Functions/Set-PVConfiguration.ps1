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
		[ValidateScript( {Test-Path $_ -PathType Leaf})]
		[ValidateNotNullOrEmpty()]
		[string]$ClientPath
	)

	Begin {

		$Defaults = [pscustomobject]@{}

	}

	Process {

		If($PSBoundParameters.Keys -contains "ClientPath") {

			$Defaults | Add-Member -MemberType NoteProperty -Name ClientPath -Value $ClientPath

		}

	}

	End {

		Set-Variable -Name PV -Value $Defaults -Scope Script

		$Script:PV | Select-Object -Property * | Export-Clixml -Path "$env:HOMEDRIVE$env:HomePath\PV_Configuration.xml" -Force

	}

}