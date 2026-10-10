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

				$InputObj = [PSCustomObject]@{
					
					
					safeName = "SomeSafe"
					folder   = "SomeFolder"
					file     = "SomeFile"
				}

				$Password = ConvertTo-SecureString "SomePassword" -AsPlainText -Force

				Mock Invoke-PACLICommand -MockWith {
					[PSCustomObject]@{
						StdOut   = (1..7 | ForEach-Object { '"' + ((1..7) -join '","') + '"' }) -join "`r`n"
						ExitCode = 0
					}
				}

			}

			It "executes without exception" {

				{ $InputObj | Get-PVFileActivity } | Should -Not -Throw
			}

			It "outputs expected number of objects" {

				@($InputObj | Get-PVFileActivity) | Should -HaveCount 7

			}

			It "invokes expected pacli command" {

				$InputObj | Get-PVFileActivity

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "INSPECTFILE"

				}

			}

		}

	}

}