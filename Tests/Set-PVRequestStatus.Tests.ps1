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
					
					
					safe      = "SomeSafe"
					requestID = 123

				}

				$Password = ConvertTo-SecureString "SomePassword" -AsPlainText -Force

				Mock Invoke-PACLICommand -MockWith {
					[PSCustomObject]@{
						StdOut   = $((((1..21) * 7 -join '" "') -replace '^', '"') -replace '$', '"')
						ExitCode = 0
					}
				}

			}

			It "executes without exception" {

				{ $InputObj | Set-PVRequestStatus -confirmRequest } | Should Not throw

			}

			It "invokes expected pacli command" {

				$InputObj | Set-PVRequestStatus -confirmRequest

				Assert-MockCalled Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "CONFIRMREQUEST"

				}

			}

		}

	}

}