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

				$InputObj = @(
					[PSCustomObject]@{ Safename = 'System'; Location = '\' }
					[PSCustomObject]@{ Safename = 'SomeSafe'; Location = '\Some Location' }
					[PSCustomObject]@{ Safename = 'Some Other Safe'; Location = $null }
					[PSCustomObject]@{ Safename = "Pete's[Safe]"; Location = '\' }
					[PSCustomObject]@{ Safename = $null; Location = '\' }
				)

			}

			It "returns CompletionResult objects" {

				$InputObj | Get-CompletionResult -ValueProperty Safename | Should -BeOfType System.Management.Automation.CompletionResult

			}

			It "returns all values with no word to complete" {

				@($InputObj | Get-CompletionResult -ValueProperty Safename).Count | Should -Be 4

			}

			It "filters values by case-insensitive prefix" {

				$Result = $InputObj | Get-CompletionResult -WordToComplete 'so' -ValueProperty Safename

				$Result.ListItemText | Should -Be @('SomeSafe', 'Some Other Safe')

			}

			It "ignores quotes typed before the word to complete" {

				$Result = $InputObj | Get-CompletionResult -WordToComplete "'Some O" -ValueProperty Safename

				$Result.ListItemText | Should -Be 'Some Other Safe'

			}

			It "treats wildcard characters in the word to complete literally" {

				@($InputObj | Get-CompletionResult -WordToComplete '*' -ValueProperty Safename).Count | Should -Be 0
				($InputObj | Get-CompletionResult -WordToComplete "Pete's[" -ValueProperty Safename).ListItemText | Should -Be "Pete's[Safe]"

			}

			It "quotes values containing whitespace" {

				($InputObj | Get-CompletionResult -WordToComplete 'Some O' -ValueProperty Safename).CompletionText | Should -Be "'Some Other Safe'"

			}

			It "escapes single quotes in quoted values" {

				($InputObj | Get-CompletionResult -WordToComplete 'Pete' -ValueProperty Safename).CompletionText | Should -Be "'Pete''s[Safe]'"

			}

			It "does not quote simple values" {

				($InputObj | Get-CompletionResult -WordToComplete 'Sys' -ValueProperty Safename).CompletionText | Should -Be 'System'

			}

			It "includes tooltip property value in tooltip" {

				($InputObj | Get-CompletionResult -WordToComplete 'SomeS' -ValueProperty Safename -ToolTipProperty Location).ToolTip | Should -Be 'SomeSafe (\Some Location)'

			}

			It "uses value as tooltip when tooltip property has no value" {

				($InputObj | Get-CompletionResult -WordToComplete 'Some O' -ValueProperty Safename -ToolTipProperty Location).ToolTip | Should -Be 'Some Other Safe'

			}

			It "matches values without leading backslash" {

				$Locations = [PSCustomObject]@{ Location = '\System' }

				($Locations | Get-CompletionResult -WordToComplete 'Sys' -ValueProperty Location).CompletionText | Should -Be '\System'
				($Locations | Get-CompletionResult -WordToComplete '\Sys' -ValueProperty Location).CompletionText | Should -Be '\System'

			}

			It "sets result type to ParameterValue" {

				($InputObj | Get-CompletionResult -WordToComplete 'Sys' -ValueProperty Safename).ResultType | Should -Be 'ParameterValue'

			}

		}

	}

}
