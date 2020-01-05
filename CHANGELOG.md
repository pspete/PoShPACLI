# Changelog

All notable changes to this project will be documented in this file.

## [2.0.20] - 2020-01-03

- **5 Year Anniversary Update**
- Breaking Changes
  - New PowerShell Version Requirements
    - Module now requires PowerShell Version 5.
  - Updated Parameter Requirements
    - Removed Parameters `-User`, `-Vault` & `-SessionID`.
      - Parameter values are now set in the module scope and are not required to be passed individually to each function.
      - Where a functions output only contained `vault`, `user` & `sessionID` properties, there is now no output.
      - Where `vault`, `user` & `sessionID` were added as properties of the output, they are no longer returned in the output object.
  - Behavior Changes
    - `Start-PVPACLI`
      - Invocation of function results in `sessionID` being set in module scope.
      - The value for `sessionID` will be used for all subsequent module operations.
      - value can be changed in the module scope using the `Set-PVConfiguration` function.
    - `New-PVVaultDefinition`
      - Invocation of function results in `vault` being set in module scope.
      - The value for `vault` will be used for all subsequent module operations.
      - value can be changed in the module scope using the `Set-PVConfiguration` function.
    - `Import-PVVaultDefinition`
      - Invocation of function results in `vault` being set in module scope.
      - The value for `vault` will be used for all subsequent module operations.
      - value can be changed in the module scope using the `Set-PVConfiguration` function.
    - `Connect-PVVault`
      - Invocation of function results in `user` being set in module scope.
      - The value for `user` will be used for all subsequent module operations.
      - value can be changed in the module scope using the `Set-PVConfiguration` function.
    - `New-PVSafe`
      - Parameter `safeOptions` updated to use Enum
        - Accepts values:
          - `PartiallyImpersonatedUsers` (Enable access to partially impersonated users)
          - `FullyImpersonatedUsers` (Enable access to fully impersonated users)
          - `ImpersonatedUsers` (Enable access to impersonated users with additional Vault authentication)
          - `EnforceSafeOpening` (Enforce Safe opening from PrivateArk Client)
      - Parameter `securityLevelParm` updated to use Enum
        - Accepts values:
          - Locations: `Internal`, `External`, `Public`.
          - Security Areas: `HighlySecured`, `Secured`, `Unsecured`
    - `New-PVNetworkArea`
      - Parameter `securityLevelParm` updated to use Enum
        - Accepts values:
          - Locations: `Internal`, `External`, `Public`.
          - Security Areas: `HighlySecured`, `Secured`, `Unsecured`
- Other Updates
  - New Function
    - `Get-PVConfiguration`
      - Allows module user to query current values in use for `ClientPath`, `sessionID`, `user` & `vault`.
  - Updated Function
    - `Set-PVConfiguration`
      - Added ability to set `sessionID`, `user` & `vault` values to be used by module functions for PACLI operations.
      - Added file version check when setting ClientPath to ensure minimum required PACLI Executable is specified.
        - Specifying PACLI.exe with a version less than 7.2 will raise an error.
    - `Import-PVVaultDefinition`
      - Parameter `vault` updated to be Mandatory, enables value to be set in module scope for subsequent module operations.
  - Removed Function
    - `Remove-PVVaultDefinition`
      - Module requires at least PACLI 7.2, which does not support the `DELETEVAULT` command.
    - `Get-PVHttpGwUrl`
      - Module requires at least PACLI 7.2, which does not support the `GETHTTPGWURL` command.
  - Performance Improvements
    - Update for quicker parsing of output data.
    - Extraneous/immaterial verbose & debug messages removed.
    - Substitute Regex Replace with String Replace where possible to improve speed of required replace operations.
    - Provide mechanism for masking secret values in debug/verbose messages.

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
