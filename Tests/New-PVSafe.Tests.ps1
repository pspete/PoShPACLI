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

				$Password = ConvertTo-SecureString "SomePassword" -AsPlainText -Force

				Mock Invoke-PACLICommand -MockWith {
					[PSCustomObject]@{
						StdOut   = '"SomeOutput"'
						ExitCode = 0
					}
				}

			}

			It "executes without exception" {

				{New-PVSafe -password $Password -safe  "SomeSafe" -confirmationCount 7} | Should -Not -Throw

			}

			It "invokes expected pacli command" {

				New-PVSafe -password $Password -safe  "SomeSafe"

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "ADDSAFE"

				}

			}

			It "passes secret values as SecureString" {

				New-PVSafe -password $Password -safe "SomeSafe"

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					($CommandParameters -notmatch 'SomePassword') -and
					($SecretParameters["password"] -is [securestring])

				}

			}

			It "tranlates expected safeOptions enum value" {

				New-PVSafe -password $Password -safe  "SomeSafe" -safeOptions EnforceSafeOpening, FullyImpersonatedUsers, ImpersonatedUsers, PartiallyImpersonatedUsers, EnforceSafeOpening

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$CommandParameters -match "safeOptions=960"

				}

			}

			It "tranlates expected securityLevelParm enum value" {

				New-PVSafe -password $Password -safe  "SomeSafe" -securityLevelParm Internal, HighlySecured

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$CommandParameters -match "securityLevelParm=9"

				}

			}

			It "sends PACLI argument names for aliased parameters" {

				New-PVSafe -password $Password -safe "SomeSafe" -alwaysNeedsConfirmation -safeKey "SomeKey"

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					($CommandParameters -match 'alwaysNeedConfirmation=Yes') -and ($CommandParameters -match 'keyFilePath="SomeKey"')

				}

			}

		}

	}

}
