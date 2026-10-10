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
					
					
					fromDate = (Get-Date 1-1-1970)
				}

				$Password = ConvertTo-SecureString "SomePassword" -AsPlainText -Force

				Mock Invoke-PACLICommand -MockWith {
					[PSCustomObject]@{
						StdOut   = @'
"Notification Engine","3","14","15","51","Sat Aug  1 00:25:17 2026","Thu Oct 29 23:25:17 2026","pspete","530","PVWAGWUser","21","PVWA","15.02.000","192.168.10.21","<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<EventData>

  <Parms>
    <Parm Name="CA-LicenseUsageExistingUsers">30</Parm>
  </Parms>

</EventData>
"
"Notification Engine","3","13","15","51","Sat Aug  1 00:25:17 2026","Thu Oct 29 23:25:17 2026","pspete","530","PVWAGWUser","21","PVWA","15.02.000","192.168.10.21","<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<EventData>

  <Parms>
    <Parm Name="CA-LicenseUsageExistingUsers">27</Parm>
  </Parms>

</EventData>
"
"SomeSafe","4","11","2","7","Sat Aug  1 00:25:17 2026","Thu Oct 29 23:25:17 2026","SomeUser","531","SomeAgent","22","SomeClient","15.02.000","192.168.10.22","Some Data"
'@
						ExitCode = 0
					}
				}

			}

			It "executes without exception" {

				{ $InputObj | Get-PVSafeEvent } | Should -Not -Throw

			}

			It "invokes expected pacli command" {

				$InputObj | Get-PVSafeEvent

				Should -Invoke Invoke-PACLICommand -Times 1 -Exactly -Scope It -ParameterFilter {

					$PacliCommand -eq "SAFEEVENTSLIST"

				}

			}

			It "outputs one object per event" {

				$Result = $InputObj | Get-PVSafeEvent

				$Result.Count | Should -Be 3

			}

			It "outputs expected property values for events with XML data" {

				$Result = $InputObj | Get-PVSafeEvent

				$Result[0].Safename | Should -Be 'Notification Engine'
				$Result[0].EventID | Should -Be '14'
				$Result[0].FromIP | Should -Be '192.168.10.21'
				([xml]$Result[0].Data).EventData.Parms.Parm.'#text' | Should -Be '30'
				$Result[1].EventID | Should -Be '13'
				([xml]$Result[1].Data).EventData.Parms.Parm.'#text' | Should -Be '27'

			}

			It "outputs expected property values for events without XML data" {

				$Result = $InputObj | Get-PVSafeEvent

				$Result[2].Safename | Should -Be 'SomeSafe'
				$Result[2].EventID | Should -Be '11'
				$Result[2].Username | Should -Be 'SomeUser'
				$Result[2].Data | Should -Be 'Some Data'

			}

			It "outputs expected object type" {

				$Result = $InputObj | Get-PVSafeEvent

				$Result[0].PSObject.TypeNames[0] | Should -Be 'pacli.PoShPACLI.Safe.Event'

			}

		}

	}

}