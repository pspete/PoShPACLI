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

		Context "General" {

			BeforeEach {

				Mock Get-Variable -MockWith {
					
				}

			}

			it "executes expected command" {

				Get-PVConfiguration

				Should -Invoke -CommandName Get-Variable -Times 1 -Scope It

			}

			it "returns expected error" {

				Mock Get-Variable -MockWith {
					throw someError
				}
				{ Get-PVConfiguration } | Should -Throw "PVConfiguration not found. Run Set-PVConfiguration."

			}

		}

	}

}