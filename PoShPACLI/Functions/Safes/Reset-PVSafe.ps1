Function Reset-PVSafe {

	<#
    .SYNOPSIS
    Resets the access marks on an open Safe.

    .DESCRIPTION
    Exposes the PACLI Function: "RESETSAFE"

    .PARAMETER safe
    The name of the Safe containing the access marks to reset.

    .EXAMPLE
	Reset-PVSafe -safe ORACLE

	Resets access marks on ORACLE safe

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath RESETSAFE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}