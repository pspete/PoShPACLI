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
					
					
					safe   = "someSafe"
					folder = "SomeFolder"
					file   = "SomeFile"
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

				{ $InputObj | Get-PVPasswordObject } | Should -Not -Throw

			}

			It "invokes expected pacli command" {

				$InputObj | Get-PVPasswordObject

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "RETRIEVEPASSWORDOBJECT"

				}

			}

			It "sends PACLI argument names for aliased parameters" {

				$InputObj | Get-PVPasswordObject -userRequest

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					($CommandParameters -match 'useRequest=Yes')

				}

			}

			It "outputs password value" {

				$Result = $InputObj | Get-PVPasswordObject

				$Result.Password | Should -Be 'SomeOutput'

			}

			It "outputs expected object type" {

				$Result = $InputObj | Get-PVPasswordObject

				$Result.PSObject.TypeNames[0] | Should -Be 'pacli.PoShPACLI.Password'

			}

			It "preserves spaces, quotes and separators in password value" {

				Mock Invoke-PACLICommand -MockWith {
					[PSCustomObject]@{
						StdOut   = "`"Some Pass`",`"word`"`r`n"
						ExitCode = 0
					}
				}

				$Result = $InputObj | Get-PVPasswordObject

				$Result.Password | Should -BeExactly 'Some Pass","word'

			}

			It "outputs password as SecureString with AsSecureString" {

				$Result = $InputObj | Get-PVPasswordObject -AsSecureString

				$Result.Password | Should -BeOfType [securestring]
				[System.Net.NetworkCredential]::new('', $Result.Password).Password | Should -BeExactly 'SomeOutput'

			}

			It "does not send AsSecureString to PACLI" {

				$InputObj | Get-PVPasswordObject -AsSecureString

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$CommandParameters -notmatch 'AsSecureString'

				}

			}

			It "does not pass password value to other commands" {

				Mock ConvertFrom-PacliOutput -MockWith { }
				Mock Add-ObjectDetail -MockWith { }

				$InputObj | Get-PVPasswordObject

				Should -Invoke ConvertFrom-PacliOutput -Times 0 -Exactly -Scope It
				Should -Invoke Add-ObjectDetail -Times 0 -Exactly -Scope It

			}

		}

	}

}
