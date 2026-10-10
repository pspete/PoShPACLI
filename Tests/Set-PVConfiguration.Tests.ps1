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

		Context "General" {

			BeforeEach {

				Mock Test-Path -MockWith {
					$true
				}

				$InputObj = [pscustomobject]@{
					ClientPath = "C:\Windows\System32\cmd.exe"
				}

			}

			it "sets value of script scope variable" {

				$InputObj | Set-PVConfiguration
				$Script:PV | Should -Not -BeNullOrEmpty
			}

			it "sets client path property value" {
				$InputObj | Set-PVConfiguration
				$($Script:PV.ClientPath) | Should -Be "C:\Windows\System32\cmd.exe"
			}

			it "sets independent property value" {
				Set-PVConfiguration -sessionID 666
				$($Script:PV.sessionID) | Should -Be "666"
				$($Script:PV.ClientPath) | Should -Be "C:\Windows\System32\cmd.exe"
			}

			it "throws as expected" { 

				Mock Get-Item -MockWith {
					[PSCustomObject]@{
						VersionInfo = [PSCustomObject]@{
							ProductVersion = 5.5
						}
					}
				}
				
				{ $InputObj | Set-PVConfiguration } | Should -Throw


			}

		}

	}

}