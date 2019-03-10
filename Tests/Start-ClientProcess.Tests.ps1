#Get Current Directory
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

#Get Function Name
$FunctionName = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -Replace ".Tests.ps1"

#Assume ModuleName from Repository Root folder
$ModuleName = Split-Path (Split-Path $Here -Parent) -Leaf

BeforeAll {

	#$Script:RequestBody = $null

}

AfterAll {

	#$Script:RequestBody = $null

}

Describe $FunctionName {

	InModuleScope $ModuleName {

		Context "Mandatory Parameters" {

			$Parameters = @{Parameter = 'Process'}

			It "specifies parameter <Parameter> as mandatory" -TestCases $Parameters {

				param($Parameter)

				(Get-Command Start-ClientProcess).Parameters["$Parameter"].Attributes.Mandatory | Should Be $true

			}



		}

		Context "Default" {

			BeforeEach {

				$Process = New-MockObject -Type "System.Diagnostics.Process"
				$StandardOutput = New-Object -TypeName PSObject
				$StandardError = New-Object -TypeName PSObject

				$StandardOutput | Add-Member -MemberType ScriptMethod -Name ReadToEnd -Value {"Standard Output String"} -Force
				$StandardError | Add-Member -MemberType ScriptMethod -Name ReadToEnd -Value {"Standard Error String"} -Force

				$Process | Add-Member -MemberType ScriptMethod -Name Start -Value {$true} -Force
				$Process | Add-Member -MemberType ScriptMethod -Name WaitForExit -Value {$true} -Force
				$Process | Add-Member -MemberType NoteProperty -Name ExitCode -Value 9876 -Force
				$Process | Add-Member -MemberType ScriptMethod -Name Dispose -Value {$true} -Force
				$Process | Add-Member -MemberType NoteProperty -Name StandardOutput -Value $StandardOutput -Force
				$Process | Add-Member -MemberType NoteProperty -Name StandardError -Value $StandardError -Force

				$InputObj = [pscustomobject]@{
					Process = $Process
				}


			}

			It "executes without exception" {

				{$InputObj | Start-ClientProcess} | Should Not throw


			}




		}

	}

}