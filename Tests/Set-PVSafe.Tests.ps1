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

		Context "Default" {

			BeforeEach {

				$InputObj = [PSCustomObject]@{


					safe  = "SomeSafe"
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

				{ $InputObj | Set-PVSafe } | Should Not throw

			}

			It "invokes expected pacli command" {

				$InputObj | Set-PVSafe -confirmationCount 7

				Assert-MockCalled Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "UPDATESAFE"

				}

			}

			It "tranlates expected safeOptions enum value" {

				Set-PVSafe -safe  "SomeSafe" -safeOptions EnforceSafeOpening, FullyImpersonatedUsers, ImpersonatedUsers, PartiallyImpersonatedUsers, EnforceSafeOpening

				Assert-MockCalled Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$CommandParameters -match "safeOptions=960"

				}

			}

			It "tranlates expected securityLevelParm enum value" {

				Set-PVSafe -password $Password -safe  "SomeSafe" -securityLevelParm Internal, HighlySecured

				Assert-MockCalled Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$CommandParameters -match "securityLevelParm=9"

				}

			}

		}

	}

}