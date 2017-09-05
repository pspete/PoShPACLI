Function Test-PACLI {
	<#
    .SYNOPSIS
        Test Pre-Requisites needed for PACLI executable to run.

    .DESCRIPTION
        Module functions which call the PACLI utility require that a specific variable
        is set to the full path of the PACLI utility on the Local System and is in a scope
        accessible to the function.
        Function Test-PACLI ensures that both the variable is set, and that the path
        to the utility stored in the variable resolves OK.

        Returns True, or, if one or both of the conditions is not met, False.

    .PARAMETER pacliVar
        The name of the variable containing the path to the PACLI Utility.

    .EXAMPLE
        Test-PACLI

    .NOTES
    	AUTHORS: Pete Maan, Brandon Lundt

    #>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False)]
		[string]$pacliVar = "pacli"
	)

	if ((Get-Variable -Name $pacliVar) -and
		(Test-Path (Get-Variable -Name $pacliVar -ValueOnly ) -PathType leaf -Include "*.exe" )) {
			Write-Output $true
	}#if
	else {
		Write-Error "Failed Pre-Requisite Checks: ensure PACLI.exe is available, then run Initialize-PoShPACLI"
		Write-Output $False
	}#else

}