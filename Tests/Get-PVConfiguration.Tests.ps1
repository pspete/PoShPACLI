#Get Current Directory
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

#Get Function Name
$FunctionName = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -Replace ".Tests.ps1"

#Assume ModuleName from Repository Root folder
$ModuleName = Split-Path (Split-Path $Here -Parent) -Leaf

if( -not (Get-Module -Name $ModuleName -All)) {

	#Resolve Path to Module Directory
	$ModulePath = Resolve-Path "$Here\..\$ModuleName"
	#Define Path to Module Manifest
	$ManifestPath = Join-Path "$ModulePath" "$ModuleName.psd1"
	Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop

}

BeforeAll {

	#$Script:RequestBody = $null

}

AfterAll {

	#$Script:RequestBody = $null

}

Describe $FunctionName {

	InModuleScope $ModuleName {

		Context "General" {

			BeforeEach {

				Mock Get-Variable -MockWith {
					
				}

			}

			it "executes expected command" {

				Get-PVConfiguration

				Assert-MockCalled -CommandName Get-Variable -Times 1 -Scope It

			}

			it "returns expected error" {

				Mock Get-Variable -MockWith {
					throw someError
				}
				{ Get-PVConfiguration } | should throw "PVConfiguration not found. Run Set-PVConfiguration."

			}

		}

	}

}