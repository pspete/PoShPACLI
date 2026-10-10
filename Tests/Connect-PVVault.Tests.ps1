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

		Context "Default" {

			BeforeEach {

				Set-PVConfiguration -ClientPath "C:\Windows\System32\cmd.exe"

				$InputObj = [PSCustomObject]@{
					
					user = "SomeUser"
					
				}

				$Password = ConvertTo-SecureString "SomePassword" -AsPlainText -Force

				Mock Invoke-PACLICommand -MockWith {
					[PSCustomObject]@{
						StdOut   = '"SomeOutput"'
						ExitCode = 0
					}
				}

			}

			It "executes without exception" {

				{ $InputObj | Connect-PVVault -password $Password -newPassword $Password } | Should -Not -Throw

			}

			It "invokes expected pacli command" {

				$InputObj | Connect-PVVault -password $Password -newPassword $Password

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "LOGON"

				}

			}

			It "passes secret values as SecureString" {

				$InputObj | Connect-PVVault -password $Password -newPassword $Password -WarningAction SilentlyContinue

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					($CommandParameters -notmatch 'SomePassword') -and
					($SecretParameters["password"] -is [securestring]) -and
					($SecretParameters["newPassword"] -is [securestring])

				}

			}

			It "warns when password is used" {

				$InputObj | Connect-PVVault -password $Password -WarningVariable Warn -WarningAction SilentlyContinue

				$Warn | Should -Match 'clear text'

			}

			It "does not warn when logon file is used" {

				$InputObj | Connect-PVVault -logonFile "SomeFile" -WarningVariable Warn -WarningAction SilentlyContinue

				$Warn | Should -BeNullOrEmpty

			}

		}

	}

}