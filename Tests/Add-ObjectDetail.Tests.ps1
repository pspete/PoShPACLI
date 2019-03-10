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

		Context "General" {

			BeforeEach {

				$InputObj = [pscustomobject]@{}
				$InputObj | Add-ObjectDetail -TypeName SomeType -PropertyToAdd @{"SomeProperty" = "SomeValue"} -DefaultProperties SomeProperty

			}

			It "Adds Expected Type to Object" {

				$InputObj | get-member | select-object -expandproperty typename -Unique | Should Be "SomeType"

			}

			It "Adds Expected Property to Object" {

				$InputObj.SomeProperty | Should Be "SomeValue"

			}

		}

	}

}