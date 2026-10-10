#Requires -Modules Pester, PSScriptAnalyzer
<#
.SYNOPSIS
    Tests module for consistency, expected structures, settings, components & files.
.EXAMPLE
    Invoke-Pester
.NOTES
    A generic set of tests to apply to a module
#>

BeforeDiscovery {

	#Assume ModuleName from Test File Name
	$ModuleName = (Split-Path -Leaf $PSCommandPath) -Replace '.Tests.ps1'

	#Define Path to Module Manifest
	$ManifestPath = Join-Path (Resolve-Path "$PSScriptRoot\..\$ModuleName") "$ModuleName.psd1"

	if ( -not (Get-Module -Name $ModuleName -All)) {

		Import-Module -Name "$ManifestPath" -ArgumentList $true -Force -ErrorAction Stop

	}

	$Module = Get-Module -Name $ModuleName

	$Manifest = Import-PowerShellDataFile -Path $ManifestPath
	$FormatFiles = @($Manifest.FormatsToProcess | ForEach-Object { @{ Name = $PSItem } })
	$TypesFiles = @($Manifest.TypesToProcess | ForEach-Object { @{ Name = $PSItem } })

	$ExportedFunctions = @($Module.ExportedFunctions.Values.Name | ForEach-Object {
			$help = Get-Help $PSItem -Full
			@{
				Name           = $PSItem
				HelpParameters = @(
					$help.parameters.parameter | Where-Object { $PSItem.name -and $PSItem.name -NotIn @('WhatIf', 'Confirm') } |
						ForEach-Object { @{ Name = $PSItem.name } }
				)
			}
		})

	$ExportedAliases = @($Module.ExportedAliases.Values | ForEach-Object { $PSItem.Name } | ForEach-Object { @{ Name = $PSItem } })

}

Describe 'Module' {

	BeforeAll {

		$ModuleName = (Split-Path -Leaf $PSCommandPath) -Replace '.Tests.ps1'
		$ModulePath = Resolve-Path "$PSScriptRoot\..\$ModuleName"
		$ManifestPath = Join-Path $ModulePath "$ModuleName.psd1"
		$Module = Get-Module -Name $ModuleName

		$PublicFunctions = Get-ChildItem "$ModulePath\Functions" -Include *.ps1 -Recurse |
			Select-Object -ExpandProperty BaseName

	}

	Context 'Module Consistency Tests' {

		It 'has a valid manifest' {

			{ $null = Test-ModuleManifest -Path $ManifestPath -ErrorAction Stop -WarningAction SilentlyContinue } |
				Should -Not -Throw

		}

		It 'specifies valid root module' {

			$Module.RootModule | Should -Be "$ModuleName.psm1"

		}

		It 'has a valid description' {

			$Module.Description | Should -Not -BeNullOrEmpty

		}

		It 'has a valid guid' {

			$Module.Guid | Should -Be '194c227f-87bf-43af-b401-4a34bd8e2ac6'

		}

		It 'has a valid copyright' {

			$Module.Copyright | Should -Not -BeNullOrEmpty

		}

		Context 'Files To Process' {

			It '<Name> exists' -ForEach ($FormatFiles + $TypesFiles) {

				Join-Path $ModulePath $Name | Should -Exist

			}

			It '<Name> is valid format data' -ForEach $FormatFiles {

				{ Update-FormatData -AppendPath (Join-Path $ModulePath $Name) -ErrorAction Stop -WarningAction SilentlyContinue } |
					Should -Not -Throw

			}

			It '<Name> is valid type data' -ForEach $TypesFiles {

				{ Update-TypeData -AppendPath (Join-Path $ModulePath $Name) -ErrorAction Stop -WarningAction SilentlyContinue } |
					Should -Not -Throw

			}

		}

		Context 'Exported Function Analysis' {

			It 'exports the expected number of functions' {

				@($PublicFunctions).Count | Should -Be @($Module.ExportedFunctions.Values).Count

			}

			Context '<Name>' -ForEach $ExportedFunctions {

				BeforeAll {

					$help = Get-Help $Name -Full

				}

				It 'is a public function' {

					$PublicFunctions -contains $Name | Should -Be $true

				}

				It 'has a related pester tests file' {

					Join-Path $PSScriptRoot "$Name.Tests.ps1" | Should -Exist

				}

				It 'has synopsis' {

					$help.synopsis | Should -Not -BeNullOrEmpty

				}

				It 'has description' {

					$help.description | Should -Not -BeNullOrEmpty

				}

				It 'has example code' {

					$help.examples.example.code | Should -Not -BeNullOrEmpty

				}

				It 'has description of parameter <Name>' -ForEach $HelpParameters {

					($help.parameters.parameter | Where-Object name -EQ $Name).description | Should -Not -BeNullOrEmpty

				}

			}

		}

		Context 'Exported Alias Analysis' {

			It '<Name> resolves to public function' -ForEach $ExportedAliases {

				$PublicFunctions -contains (Get-Alias $Name).ResolvedCommand.Name | Should -Be $true

			}

		}

	}

}

Describe 'PSScriptAnalyzer' {

	It 'reports no issues' {

		Invoke-ScriptAnalyzer -Path "$PSScriptRoot\..\PoShPACLI" -Recurse | Should -BeNullOrEmpty

	}

}
