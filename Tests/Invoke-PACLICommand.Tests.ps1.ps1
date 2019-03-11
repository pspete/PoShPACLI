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

			$Parameters = @{Parameter = 'PacliCommand'}

			It "specifies parameter <Parameter> as mandatory" -TestCases $Parameters {

				param($Parameter)

				(Get-Command Invoke-PACLICommand).Parameters["$Parameter"].Attributes.Mandatory | Should Be $true

			}



		}

		Context "Default" {

			BeforeEach {

				Mock Start-ClientProcess -MockWith {
					Write-Output @{}
				}

				$InputObj = [pscustomobject]@{
					PacliCommand      = "SOMECMD"
					CommandParameters = "Some Command Parameters"
				}


			}

			It "tests path" {

				{$InputObj | Invoke-PACLICommand -PacliEXE .\RandomFile.exe} | Should Throw

			}

			It "throws if `$PV variable not set in script scope" {

				{$InputObj | Invoke-PACLICommand} | Should Throw

			}

			It "throws if `$PV variable does not have ClientPath property" {

				$object = [PSCustomObject]@{
					prop1 = "Value1"
					prop2 = "Value2"
				}
				New-Variable -Name PV -Value $object

				{$InputObj | Invoke-PACLICommandent} | Should Throw

			}

			It "throws if `$PV.ClientPath is not resolvable" {

				$object = [PSCustomObject]@{
					ClientPath = ".\RandomFile.Exe"
					prop2      = "Value2"
				}
				New-Variable -Name PV -Value $object

				{$InputObj | Invoke-PACLICommand} | Should Throw

			}

			It "no throw if `$PV.ClientPath is resolvable" {

				$object = [PSCustomObject]@{
					ClientPath = ".\README.md"
				}
				New-Variable -Name PV -Value $object

				{$InputObj | Invoke-PACLICommand} | Should Throw

			}


		}

		Context "Set-PVConfiguration" {

			BeforeEach {

				Mock Test-Path -MockWith {
					$true
				}

				Mock Start-ClientProcess -MockWith {
					Write-Output @{}
				}

				$InputObj = [pscustomobject]@{
					PacliCommand      = "SOMECMD"
					CommandParameters = "Some Command Parameters"
				}


			}

			it "does not throw after Set-PVConfiguration has set the `$PV variable" {

				Set-PVConfiguration -ClientPath "C:\SomePath\PACLI.exe"
				{$InputObj | Invoke-PACLICommand} | Should Not throw

			}

			it "does not require Set-PVConfiguration to be run more than once" {

				{$InputObj | Invoke-PACLICommand} | Should Not throw

			}

		}

		Context "Reporting Errors" {

			BeforeEach {

				$InputObj = [pscustomobject]@{
					PacliCommand      = "SOMECMD"
					CommandParameters = "Some Command Parameters"
				}


			}

			it "reports errors received on stderr" {

				Mock Start-ClientProcess -MockWith {
					[pscustomobject]@{
						"ExitCode" = -1
						"StdOut"   = $null
						"StdErr"   = "APPAP008E Problem occurred while trying something"
					}

				}

				{$InputObj | Invoke-PACLICommand -ErrorAction Stop} | Should Throw

			}

		}

		Context "Command Arguments" {
			Mock Test-Path -MockWith {
				$true
			}

			Mock Start-ClientProcess -MockWith {
				Write-Output @{}
			}

			$InputObj = [pscustomobject]@{
				PacliCommand      = "SOMECMD"
				CommandParameters = "Some Command Parameters"
			}

			It "executes command with expected arguments" {

				$InputObj | Invoke-PACLICommand

				Assert-MockCalled Start-ClientProcess -Times 1 -Exactly -Scope It -ParameterFilter {

					$Process.StartInfo.Arguments -eq $('SOMECMD Some Command Parameters')

				}

			}

		}

	}

}