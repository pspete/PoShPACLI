#Get Current Directory
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

#Get Function Name
$FunctionName = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -Replace ".Tests.ps1"

#Assume ModuleName from Repository Root folder
$ModuleName = Split-Path (Split-Path $Here -Parent) -Leaf

#Resolve Path to Module Directory
$ModulePath = Resolve-Path "$Here\..\$ModuleName"

#Define Path to Module Manifest
$ManifestPath = Join-Path "$ModulePath" "$ModuleName.psd1"

if ( -not (Get-Module -Name $ModuleName -All)) {

	Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop

}

Describe $FunctionName {

	InModuleScope $ModuleName {

		$String = 'user="SomeUser" password="SomePass" sessionID=666 vault="SomeVault" newPassword="SomeNewPass" proxyPassword="SomePoxyPassword"'

		It 'returns a string' {
			$ReturnData = Hide-SecretValue -InputValue $String
			$ReturnData | Should BeOfType System.String

		}

		It "does not include secret values in return data" {
			$ReturnData = Hide-SecretValue -InputValue $String
			$ReturnData | Should Be 'user="SomeUser" password="******" sessionID=666 vault="SomeVault" newPassword="******" proxyPassword="******"'

		}

	}

}