BeforeDiscovery {
	#Get Current Directory
	$Here = Split-Path -Parent $PSCommandPath

	#Assume ModuleName from Repository Root folder
	$ModuleName = Split-Path (Split-Path $Here -Parent) -Leaf

	#Resolve Path to Module Directory
	$ModulePath = Resolve-Path "$Here\..\$ModuleName"

	#Define Path to Module Manifest
	$ManifestPath = Join-Path "$ModulePath" "$ModuleName.psd1"

	if ( -not (Get-Module -Name $ModuleName -All)) {

		Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop

	}

}

Describe ((Split-Path -Leaf $PSCommandPath) -Replace '.Tests.ps1') {

	InModuleScope $ModuleName {

		Context "Mandatory Parameters" {

			$Parameters = @{Parameter = 'PacliCommand'}

			It "specifies parameter <Parameter> as mandatory" -TestCases $Parameters {

				param($Parameter)

				(Get-Command Invoke-PACLICommand).Parameters["$Parameter"].Attributes.Mandatory | Should -Be $true

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

				$PV = $Script:PV

			}

			AfterEach {

				$Script:PV = $PV

			}

			It "throws if `$PV variable not set in script scope" {

				Remove-Variable -Name PV -Scope Script -ErrorAction SilentlyContinue

				{$InputObj | Invoke-PACLICommand} | Should -Throw

			}

			It "throws if `$PV variable does not have ClientPath property" {

				$Script:PV = [PSCustomObject]@{
					prop1 = "Value1"
					prop2 = "Value2"
				}

				{$InputObj | Invoke-PACLICommand} | Should -Throw

			}

			It "does not throw if `$PV.ClientPath is present" {

				$Script:PV = [PSCustomObject]@{
					ClientPath = "C:\Windows\System32\cmd.exe"
				}

				{$InputObj | Invoke-PACLICommand} | Should -Not -Throw

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

				Set-PVConfiguration -ClientPath "C:\Windows\System32\cmd.exe"
				{$InputObj | Invoke-PACLICommand} | Should -Not -Throw

			}

			it "does not require Set-PVConfiguration to be run more than once" {

				{$InputObj | Invoke-PACLICommand} | Should -Not -Throw

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

				{$InputObj | Invoke-PACLICommand -ErrorAction Stop} | Should -Throw

			}

		}

		Context "Command Arguments" {

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

			It "executes command with expected arguments" {

				$InputObj | Invoke-PACLICommand

				Should -Invoke Start-ClientProcess -Times 1 -Exactly -Scope It -ParameterFilter {

					$Process.StartInfo.Arguments -eq $('SOMECMD Some Command Parameters')

				}

			}

			It "outputs only the command result" {

				@($InputObj | Invoke-PACLICommand).Count | Should -Be 1

			}

			It "includes decoded secret values in command arguments" {

				$Secrets = @{
					password = ConvertTo-SecureString "Some Secret" -AsPlainText -Force
					safe     = "SomeSafe"
				}

				$InputObj | Invoke-PACLICommand -SecretParameters $Secrets

				Should -Invoke Start-ClientProcess -Times 1 -Exactly -Scope It -ParameterFilter {

					$Process.StartInfo.Arguments -eq $('SOMECMD password="Some Secret" Some Command Parameters')

				}

			}

			It "masks secret values in debug output" {

				$Secrets = @{
					password = ConvertTo-SecureString "Some Secret" -AsPlainText -Force
				}

				$DebugPreference = "Continue"
				$Debug = $InputObj | Invoke-PACLICommand -SecretParameters $Secrets 5>&1 | Where-Object { $PSItem -is [System.Management.Automation.DebugRecord] }
				$DebugPreference = "SilentlyContinue"

				$Debug.Message | Should -Be 'PACLI Command: SOMECMD password="******" Some Command Parameters'

			}

			It "does not execute command with WhatIf" {

				$InputObj | Invoke-PACLICommand -WhatIf

				Should -Invoke Start-ClientProcess -Times 0 -Exactly -Scope It

			}

		}

	}

}