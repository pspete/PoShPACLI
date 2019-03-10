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

				Mock Test-Path -MockWith {
					$true
				}

				$InputObj = [pscustomobject]@{
					ClientPath = "SomePath"
				}

			}

			it "sets value of script scope variable" {

				$InputObj | Set-PVConfiguration
				$Script:PV | Should Not BeNullOrEmpty
			}

			it "sets client path property value" {
				$InputObj | Set-PVConfiguration
				$($Script:PV.ClientPath) | Should Be "SomePath"
			}

		}

	}

}