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

	$Registered = @(
		@{ CommandName = 'Open-PVSafe'; ParameterName = 'safe'; Retrieval = 'Get-PVSafeList' }
		@{ CommandName = 'Get-PVRule'; ParameterName = 'safeName'; Retrieval = 'Get-PVSafeList' }
		@{ CommandName = 'Get-PVUser'; ParameterName = 'destUser'; Retrieval = 'Get-PVUserList' }
		@{ CommandName = 'Add-PVSafeOwner'; ParameterName = 'owner'; Retrieval = 'Get-PVUserList' }
		@{ CommandName = 'Add-PVGroupMember'; ParameterName = 'member'; Retrieval = 'Get-PVUserList' }
		@{ CommandName = 'Add-PVTrustedNetworkArea'; ParameterName = 'trusterName'; Retrieval = 'Get-PVUserList' }
		@{ CommandName = 'Get-PVGroupMember'; ParameterName = 'group'; Retrieval = 'Get-PVUserList' }
		@{ CommandName = 'Set-PVUser'; ParameterName = 'location'; Retrieval = 'Get-PVLocation' }
		@{ CommandName = 'Rename-PVNetworkArea'; ParameterName = 'networkArea'; Retrieval = 'Get-PVNetworkArea' }
	)

	$NotRegistered = @(
		@{ CommandName = 'New-PVSafe'; ParameterName = 'safe'; Retrieval = 'Get-PVSafeList' }
		@{ CommandName = 'New-PVUser'; ParameterName = 'destUser'; Retrieval = 'Get-PVUserList' }
		@{ CommandName = 'Add-PVExternalUser'; ParameterName = 'destUser'; Retrieval = 'Get-PVUserList' }
		@{ CommandName = 'New-PVGroup'; ParameterName = 'group'; Retrieval = 'Get-PVUserList' }
		@{ CommandName = 'New-PVLocation'; ParameterName = 'location'; Retrieval = 'Get-PVLocation' }
		@{ CommandName = 'New-PVNetworkArea'; ParameterName = 'networkArea'; Retrieval = 'Get-PVNetworkArea' }
	)

}

Describe ((Split-Path -Leaf $PSCommandPath) -Replace '.Tests.ps1') {

	InModuleScope $ModuleName -Parameters @{ Registered = $Registered; NotRegistered = $NotRegistered } {

		param($Registered, $NotRegistered)

		BeforeEach {

			$PV = $Script:PV
			$Script:PV = [PSCustomObject]@{ user = 'SomeUser' }

			Mock Get-PVSafeList -MockWith {
				[PSCustomObject]@{ Safename = 'SomeSafe'; Location = '\' }
				[PSCustomObject]@{ Safename = 'OtherSafe'; Location = '\' }
			}

			Mock Get-PVUserList -MockWith {
				[PSCustomObject]@{ Username = 'SomeUser'; Type = 'USER'; Location = '\' }
				[PSCustomObject]@{ Username = 'SomeGroup'; Type = 'GROUP'; Location = '\' }
			}

			Mock Get-PVLocation -MockWith {
				[PSCustomObject]@{ Location = '\SomeLocation' }
			}

			Mock Get-PVNetworkArea -MockWith {
				[PSCustomObject]@{ NetworkArea = 'SomeArea'; SecurityLevel = 'Internal' }
			}

		}

		AfterEach {

			$Script:PV = $PV

		}

		Context "Get-ArgumentCompleter" {

			BeforeEach {

				$Completer = Get-ArgumentCompleter -RetrievalCommand { Get-PVSafeList } -ValueProperty Safename -ToolTipProperty Location

			}

			It "returns a scriptblock" {

				$Completer | Should -BeOfType scriptblock

			}

			It "returns matching completion results" {

				$Result = & $Completer 'Open-PVSafe' 'safe' 'Some' $null @{ }

				$Result.CompletionText | Should -Be 'SomeSafe'
				$Result.ToolTip | Should -Be 'SomeSafe (\)'

			}

			It "does not run retrieval command without a vault user" {

				$Script:PV = [PSCustomObject]@{ user = $null }

				& $Completer 'Open-PVSafe' 'safe' 'Some' $null @{ } | Should -BeNullOrEmpty

				Should -Invoke Get-PVSafeList -Times 0 -Exactly -Scope It

			}

			It "returns nothing if retrieval command errors" {

				Mock Get-PVSafeList -MockWith { Write-Error 'Some Error' }

				{ & $Completer 'Open-PVSafe' 'safe' 'Some' $null @{ } } | Should -Not -Throw
				& $Completer 'Open-PVSafe' 'safe' 'Some' $null @{ } | Should -BeNullOrEmpty

			}

			It "returns nothing for an unknown command" {

				& $Completer 'Some-UnknownCommand' 'safe' 'Some' $null @{ } | Should -BeNullOrEmpty

			}

		}

		Context "Registered Completers" {

			It "completes <ParameterName> for <CommandName>" -ForEach $Registered {

				$Line = "$CommandName -$ParameterName "
				$Result = TabExpansion2 -inputScript $Line -cursorColumn $Line.Length

				$Result.CompletionMatches | Should -Not -BeNullOrEmpty
				Should -Invoke $Retrieval -Times 1 -Exactly -Scope It

			}

			It "completes only groups for group parameter" {

				$Line = 'Get-PVGroupMember -group '
				$Result = TabExpansion2 -inputScript $Line -cursorColumn $Line.Length

				$Result.CompletionMatches.CompletionText | Should -Be 'SomeGroup'

			}

			It "does not complete <ParameterName> for <CommandName>" -ForEach $NotRegistered {

				$Line = "$CommandName -$ParameterName "
				$null = TabExpansion2 -inputScript $Line -cursorColumn $Line.Length

				Should -Invoke $Retrieval -Times 0 -Exactly -Scope It

			}

		}

	}

}
