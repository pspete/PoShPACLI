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

				{New-PVPassword -length 125} | Should -Not -Throw

			}

			It "invokes expected pacli command" {

				New-PVPassword -length 125

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "GENERATEPASSWORD"

				}

			}

			It "processes each pipeline input object" {

				$Results = @(
					[PSCustomObject]@{ length = 10 },
					[PSCustomObject]@{ length = 20 }
				) | New-PVPassword

				Should -Invoke Invoke-PACLICommand -Times 2 -Exactly -Scope It
				$Results | Should -HaveCount 2

			}

		}

	}

}