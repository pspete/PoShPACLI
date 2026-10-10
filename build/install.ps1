#---------------------------------#
# Header                          #
#---------------------------------#
Write-Host 'Installing Required Modules:' -ForegroundColor Yellow

$RequiredModules = @(
	'PowerShellGet'
	#"Pester",
	'PSScriptAnalyzer'
)

#---------------------------------#
# Install NuGet                   #
#---------------------------------#
if (-not $IsCoreCLR) {
	Write-Host "`tNuGet..."
	$pkg = Install-PackageProvider -Name NuGet -Confirm:$false -Force -ErrorAction Stop
	Write-Host "`t`tInstalled NuGet version '$($pkg.version)'"
}

#---------------------------------#
# Install Pester 5                #
#---------------------------------#
try {
	Install-Module -Name Pester -Repository PSGallery -RequiredVersion 5.7.1 -Confirm:$false -Force -SkipPublisherCheck -ErrorAction Stop | Out-Null
} catch { throw $_ }
#---------------------------------#
# Install Required Modules        #
#---------------------------------#
foreach ($Module in $RequiredModules) {

	Try {
		Write-Host "`tInstalling: $Module..." -NoNewline
		Install-Module -Name $Module -Repository PSGallery -Confirm:$false -Force -SkipPublisherCheck -ErrorAction Stop | Out-Null
		Write-Host ' OK' -ForegroundColor Green
	} Catch {
		Write-Host 'Error' -ForegroundColor Red
		throw $_
	}

}