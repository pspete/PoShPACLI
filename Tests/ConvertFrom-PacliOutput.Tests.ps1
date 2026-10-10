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

		Context 'Mandatory Parameters' {

			$Parameters = @{Parameter = 'pacliOutput' }

			It 'specifies parameter <Parameter> as mandatory' -TestCases $Parameters {

				param($Parameter)

				(Get-Command ConvertFrom-PacliOutput).Parameters["$Parameter"].Attributes.Mandatory | Should -Be $true

			}



		}

		Context 'Default' {

			BeforeEach {

				$InputObj = '"TestValue","YES","Mon Mar 25 01:45:00 2013","NO","14","\","19","0","NO","704","YES","NO","NO","NO","Quote"Test"'

			}

			It 'executes without exception' {

				{ $InputObj | ConvertFrom-PacliOutput } | Should -Not -Throw

			}

			It 'outputs array' {

				($InputObj | ConvertFrom-PacliOutput).gettype() | Select-Object -ExpandProperty BaseType | Should -Be 'Array'

			}

			It 'outputs array with expected length' {

				($InputObj | ConvertFrom-PacliOutput).length | Should -Be 15

			}

		}

		Context 'MultiLine' {

			BeforeEach {

				$InputObj = @'
"MyPlatformName1-MyAddress1-CYBERARK_TESTING","","Thu May 27 12:41:20 2021","CPMv20","--","","Thu May 27 12:41:20 2021","CPMv20","--","","","500","NO","000000000000052","MySafeName1","Root","5","-1","PENDING","Fri May 07 09:08:48 2021","user.name","Mon May 17 15:54:51 2021","usr1","Mon May 17 15:54:51 2021","usr1","Thu May 27 12:41:20 2021","CPMv20","Thu May 27 12:41:20 2021","CPMv20","--","","UserName:CYBERARK_TESTING#PolicyID:MyTestPlatform#DeviceType:Imported Platforms#Address:MyAddress#CreationMethod:PVWA#ServiceName:MySvcName1#CPMErrorDetails:Execution error. EXT01::Did not find any matching prompt for 'Traceback (most recent call last):
  File "C:\Program Files (x86)\CyberArk\Password Manager\bin\MyScript.py", line 18, in <module>
    temp.click()
  File "C:\Program Files (x86)\Python39-32\lib\site-packages\selenium\webdriver\remote\webelement.py", line 80, in click
    self._execute(Command.CLICK_ELEMENT)
  File "C:\Program Files (x86)\Python39-32\lib\site-packages\selenium\webdriver\remote\webelement.py", line 633, in _execute
    return self._parent.execute(command, params)
  File "C:\Program Files (x86)\Python39-32\lib\site-packages\selenium\webdriver\remote\webdriver.py", line 321, in execute
    self.error_handler.check_response(response)
  File "C:\Program Files (x86)\Python39-32\lib\site-packages\selenium\webdriver\remote\errorhandler.py", line 242, in check_response
    raise exception_class(message, screen, stacktrace)
selenium.common.exceptions.ElementNotVisibleException: Message: element not visible
  (Session info: chrome=90.0.4430.93)
  (Driver info: chromedriver=2.35.528161 (5b82f2d2aae0ca24b877009200ced9065a772e73),platform=Windows NT 6.3.9600 x86_64)

'. Error code:-1#ResetImmediately:ChangeTask#RetriesCount:1#CPMStatus:failure#LastTask:ChangeTask#LastFailDate:1622112081#CPMDisabled:(CPM)MaxRetries#"
"ztest1","","Wed Jun 23 14:51:03 2021","username2","--","","Wed Jun 23 14:51:03 2021","username2","--","","","500","NO","000000000000053","MySafeName1","Root","6","-1","PENDING","Wed Jun 23 14:51:03 2021","username2","Wed Jun 23 14:51:03 2021","username2","--","","--","","--","","--","","ServiceName:xtestsvc#DeviceType:Imported Platforms#UserName:xtestusr1#PolicyID:MyTestPlatform#Address:xtestaddr1#CreationMethod:PVWA#"
'@

			}

			It 'executes without exception' {

				{ $InputObj | ConvertFrom-PacliOutput } | Should -Not -Throw

			}

			It 'outputs array' {

				($InputObj | ConvertFrom-PacliOutput).gettype() | Select-Object -ExpandProperty BaseType | Should -Be 'Array'

			}

			It 'outputs array with expected count' {

				($InputObj | ConvertFrom-PacliOutput).count | Should -Be 2

			}

			It 'outputs array with expected length' {

				($InputObj | ConvertFrom-PacliOutput | Select-Object -First 1).length | Should -Be 32

			}

			It 'outputs each record with expected length' {

				$InputObj | ConvertFrom-PacliOutput | ForEach-Object { $PSItem.length | Should -Be 32 }

			}

			It 'preserves multi-line value' {

				$Value = ($InputObj | ConvertFrom-PacliOutput | Select-Object -First 1)[31]
				$Value | Should -Match '^UserName:CYBERARK_TESTING#'
				$Value | Should -Match 'Traceback \(most recent call last\):\r?\n'
				$Value | Should -Match 'CPMDisabled:\(CPM\)MaxRetries#$'

			}

			It 'outputs expected values from record after multi-line value' {

				$Record = ($InputObj | ConvertFrom-PacliOutput | Select-Object -Last 1)
				$Record[0] | Should -Be 'ztest1'
				$Record[13] | Should -Be '000000000000053'

			}

		}

		Context 'Records' {

			It 'outputs single record as one array' {

				@('"a","b","c"' | ConvertFrom-PacliOutput).count | Should -Be 1

			}

			It 'outputs one array per record' {

				@("`"a`",`"b`"`r`n`"c`",`"d`"`r`n`r`n`"e`",`"f`"`r`n" | ConvertFrom-PacliOutput).count | Should -Be 3

			}

			It 'handles LF line endings' {

				@("`"a`",`"b`"`n`"c`",`"d`"" | ConvertFrom-PacliOutput).count | Should -Be 2

			}

			It 'preserves empty values' {

				$Record = '"a","","c",""' | ConvertFrom-PacliOutput
				$Record.length | Should -Be 4
				$Record[1] | Should -BeNullOrEmpty
				$Record[2] | Should -Be 'c'

			}

		}

	}

}