Function Stop-PVPacli {

    <#
    .SYNOPSIS
    This command terminates PACLI. Always run this at the end of every working
    session.

    .DESCRIPTION
    Exposes the PACLI Function: "TERM"

    .EXAMPLE
    Stop-PVPacli
    Ends the PACLI process

    .NOTES
    AUTHOR: Pete Maan

    #>

    [CmdLetBinding(SupportsShouldProcess)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
    param()

    $Null = Invoke-PACLICommand -PacliEXE $Script:PV.ClientPath -PacliCommand TERM -CommandParameters $($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser)

}