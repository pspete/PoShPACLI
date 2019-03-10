#Get Current Directory
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

#Get Function Name
$FunctionName = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -Replace ".Tests.ps1"

#Assume ModuleName from Repository Root folder
$ModuleName = Split-Path (Split-Path $Here -Parent) -Leaf

BeforeAll {

	#$Script:RequestBody = $null

}

AfterAll {

	#$Script:RequestBody = $null

}

Describe $FunctionName {

	InModuleScope $ModuleName {

		Context "Mandatory Parameters" {

			$Parameters = @{Parameter = 'SecureString'}

			It "specifies parameter <Parameter> as mandatory" -TestCases $Parameters {

				param($Parameter)

				(Get-Command ConvertTo-InsecureString).Parameters["$Parameter"].Attributes.Mandatory | Should Be $true

			}

		}

		Context "General" {

			BeforeEach {

				$InputObj = [pscustomobject]@{
					SecureString = ConvertTo-SecureString SomeSecureString -AsPlainText -Force
				}

			}

			It "converts securestring to plaintext" {

				ConvertTo-InsecureString -SecureString $InputObj.SecureString| Should Be "SomeSecureString"

			}

		}

	}

}