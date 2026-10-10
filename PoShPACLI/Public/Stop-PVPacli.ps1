# .ExternalHelp PoShPACLI-help.xml
function Stop-PVPacli {

    [CmdletBinding(SupportsShouldProcess)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
    param()

    $Null = Invoke-PACLICommand -PacliEXE $Script:PV.ClientPath -PacliCommand TERM -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser)

}