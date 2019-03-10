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

		Context "Default" {

			BeforeEach {

				$InputObj = @{

				}

				Mock Invoke-PACLICommand -MockWith {
					[PSCustomObject]@{
						StdOut="SomeOutput"
						ExitCode=0
					}
				}

			}

			It "executes without exception" {

				{Start-PVPacli} | Should Not throw

			}

			It "invokes expected pacli command" {

				Start-PVPacli

				Assert-MockCalled Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "INIT"

				}

			}

		}

	}

}