#---------------------------------#
# Header                          #
#---------------------------------#
Write-Host "Testing: PSVersion $($PSVersionTable.PSVersion)" -ForegroundColor Yellow

$ModulePath = Join-Path $ENV:APPVEYOR_BUILD_FOLDER $env:APPVEYOR_PROJECT_NAME
$ManifestPath = Join-Path $ModulePath "$env:APPVEYOR_PROJECT_NAME.psd1"

Import-Module Pester -RequiredVersion 5.7.1 -Force
Import-Module $ManifestPath -ArgumentList $true -Force

#---------------------------------#
# Run Pester Tests                #
#---------------------------------#
$configuration = [PesterConfiguration]::Default
$configuration.Run.Path = Join-Path $ENV:APPVEYOR_BUILD_FOLDER 'Tests'
$configuration.Run.PassThru = $true
$configuration.TestResult.Enabled = $true
$configuration.TestResult.OutputFormat = 'NUnitXml'
$configuration.TestResult.OutputPath = 'TestsResults.xml'
$configuration.CodeCoverage.Enabled = $true
$configuration.CodeCoverage.Path = Get-ChildItem $ModulePath -Include *.ps1 -Recurse | Select-Object -ExpandProperty FullName
$configuration.CodeCoverage.OutputFormat = 'JaCoCo'
$configuration.CodeCoverage.OutputPath = 'coverage.xml'
$configuration.Output.Verbosity = 'Normal'

$res = Invoke-Pester -Configuration $configuration

Write-Host 'Uploading Test Results'
$null = [System.Net.WebClient]::new().UploadFile("https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)", $(Resolve-Path .\TestsResults.xml))

Remove-Item -Path $(Resolve-Path .\TestsResults.xml) -Force

if (($env:APPVEYOR_REPO_COMMIT_AUTHOR -eq "Pete Maan") -and $env:CODECOV_TOKEN) {

	Write-Host 'Publishing Code Coverage'

	try {
		$ProgressPreference = 'SilentlyContinue'
		$null = Invoke-WebRequest -Uri 'https://cli.codecov.io/latest/windows/codecov.exe' -OutFile codecov.exe
		.\codecov.exe --disable-telem upload-process --disable-search --fail-on-error -t "$env:CODECOV_TOKEN" -f coverage.xml
	} catch {
		Write-Warning "Code coverage upload failed: $_"
	} finally {
		Remove-Item -Path .\codecov.exe -Force -ErrorAction SilentlyContinue
	}

}

Remove-Item -Path .\coverage.xml -Force -ErrorAction SilentlyContinue

#---------------------------------#
# Validate                        #
#---------------------------------#
if (($res.Result -ne 'Passed') -or ($res.PassedCount -eq 0)) {

	throw "$($res.FailedCount) tests failed, $($res.FailedContainersCount) containers failed."

}
else {

	Write-Host 'All tests passed' -ForegroundColor Green

}
