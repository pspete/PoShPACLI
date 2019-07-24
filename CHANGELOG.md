# Changelog

All notable changes to this project will be documented in this file.

## [1.1.4] - 2019-07-24

- Updated Function
  - `Find-PVFile` - Corrected parameter name.
    - `fileCategoryValueSeparator` renamed to `fileCategoryValuesSeparator`.

- Updated Tests
  - Skip PSScriptAnalyzer Tests to avoid timeout in Appveyor.

## [1.0.0] - 2019-03-11

- 1.0 Release
- Published to PowerShell Gallery
- Breaking Changes
  - `Initialize-PoShPACLI` function has been removed from the module.
    - `Set-PVConfiguration` should now be used in its place.
  - `Find-PVFile` - Parameters `fromDate` & `toDate` changed to `[DateTime]` from `[String]`
  - `Get-SafeActivity` - Parameters `fromDate` & `toDate` changed to `[DateTime]` from `[String]`
  - `Get-SafeEvent` - Parameters `fromDate` changed to `[DateTime]` from `[String]`

## [0.2.1] - 2017-11-15

- Improve Module Import Performance

## [0.2.0] - 2017-09-18

- Beta Update

## [0.0.1] - 2015-01-29

- Alpha Release
- Published to GitHub
