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

				Mock Invoke-PACLICommand -MockWith {
					[PSCustomObject]@{
						StdOut   = '"SomeOutput"'
						ExitCode = 0
					}
				}

			}

			It "executes without exception" {

				{Set-PVUserPhoto -destuser x -localfolder x -localfile x } | Should -Not -Throw

			}

			It "invokes expected pacli command" {

				Set-PVUserPhoto -destuser x -localfolder x -localfile x

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "PUTUSERPHOTO"

				}

			}

		}

	}

}