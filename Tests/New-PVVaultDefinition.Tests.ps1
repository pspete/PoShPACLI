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

		BeforeAll {

			Mock Export-Clixml -MockWith { }

		}

		Context "Default" {

			BeforeEach {

				$InputObj = [PSCustomObject]@{
					
					vault = "SomeVault"
					address = "SomeAddress"

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

				{$InputObj | New-PVVaultDefinition -proxyPassword $Password } | Should -Not -Throw

			}

			It "invokes expected pacli command" {

				$InputObj | New-PVVaultDefinition

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "DEFINE"

				}

			}

			It "passes secret values as SecureString" {

				$InputObj | New-PVVaultDefinition -proxyPassword $Password

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					($CommandParameters -notmatch 'SomePassword') -and
					($SecretParameters["proxyPassword"] -is [securestring])

				}

			}

		}

	}

}