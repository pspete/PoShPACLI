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

#Preference file must be removed and module must be re-imported for tests to complete
Remove-Item -Path "$env:HOMEDRIVE$env:HomePath\PV_Configuration.xml" -Force -ErrorAction SilentlyContinue
Remove-Module -Name $ModuleName -Force -ErrorAction SilentlyContinue
Import-Module -Name "$ManifestPath"  -ArgumentList $true -Force -ErrorAction Stop

BeforeAll {

	#$Script:RequestBody = $null

}

AfterAll {

	#$Script:RequestBody = $null

}

Describe $FunctionName {

	InModuleScope $ModuleName {

		Context "Mandatory Parameters" {

			$Parameters = @{Parameter = 'boundParameters'}

			It "specifies parameter <Parameter> as mandatory" -TestCases $Parameters {

				param($Parameter)

				(Get-Command ConvertTo-ParameterString).Parameters["$Parameter"].Attributes.Mandatory | Should Be $true

			}



		}

		Context "Default" {

			BeforeEach {

				$InputObj = @{
					"Param1"="SomeValue"
					"Param2"=$true
					"Param3"=$false
					"Param4"=666
					"SessionID"=777
					"Verbose"=$true
					"Debug"=$false
				}

			}

			It "executes without exception" {

				{$InputObj.GetEnumerator() | ConvertTo-ParameterString} | Should Not throw

			}

			It "outputs string" {

				($InputObj.GetEnumerator() | ConvertTo-ParameterString).gettype() | Select-Object -ExpandProperty Name | Should Be "String"

			}

			It "outputs expected string" {

				$InputObj.GetEnumerator() | ConvertTo-ParameterString | Should Be 'Param3=NO Param4="666" Param2=YES SessionID=777 Param1="SomeValue"'

			}

			It "outputs expected string" {

				$InputObj.GetEnumerator() | ConvertTo-ParameterString -doNotQuote Param4 | Should Be 'Param3=NO Param4=666 Param2=YES SessionID=777 Param1="SomeValue"'

			}

		}

	}

}