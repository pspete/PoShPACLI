#Get Current Directory
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

#Get Function Name
$FunctionName = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -Replace ".Tests.ps1"

#Assume ModuleName from Repository Root folder
$ModuleName = Split-Path (Split-Path $Here -Parent) -Leaf

if( -not (Get-Module -Name $ModuleName -All)) {

	#Resolve Path to Module Directory
	$ModulePath = Resolve-Path "$Here\..\$ModuleName"
	#Define Path to Module Manifest
	$ManifestPath = Join-Path "$ModulePath" "$ModuleName.psd1"
	Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop

}


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
					"Param1"    = "SomeValue"
					"Param2"    = $true
					"Param3"    = $false
					"Param4"    = 666
					"SessionID" = 777
					"Verbose"   = $true
					"Debug"     = $false
				}

			}

			It "executes without exception" {

				{$InputObj | ConvertTo-ParameterString} | Should Not throw

			}

			It "outputs string" {

				($InputObj | ConvertTo-ParameterString).gettype() | Select-Object -ExpandProperty Name | Should Be "String"

			}

			It "output string contains expected value for Param1" {

				$Output = $InputObj | ConvertTo-ParameterString
				$Output | Should BeLike '*Param1="SomeValue"*'

			}

			It "output string contains expected value for Param2" {

				$Output = $InputObj | ConvertTo-ParameterString
				$Output | Should BeLike '*Param2=YES*'
			}

			It "output string contains expected value for Param3" {

				$Output = $InputObj | ConvertTo-ParameterString
				$Output | Should BeLike '*Param3=NO*'
			}

			It "output string contains expected value for Param4" {

				$Output = $InputObj | ConvertTo-ParameterString
				$Output | Should BeLike '*Param4="666"*'
			}

			It "output string contains expected unquoted value for Param4" {

				$Output = $InputObj | ConvertTo-ParameterString -doNotQuote Param4
				$Output | Should BeLike '*Param4=666*'

			}

			It "output string does not contain value for verbose" {

				$Output = $InputObj | ConvertTo-ParameterString
				$Output | Should Not Match 'Verbose'
			}

			It "output string contains expected value for Param1" {

				$Output = $InputObj | ConvertTo-ParameterString
				$Output | Should Not Match 'Debug'
			}

		}

	}

}