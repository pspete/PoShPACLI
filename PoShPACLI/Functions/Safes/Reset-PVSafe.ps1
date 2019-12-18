Function Reset-PVSafe {

	<#
    .SYNOPSIS
    Resets the access marks on an open Safe.

    .DESCRIPTION
    Exposes the PACLI Function: "RESETSAFE"

    .PARAMETER vault
    The defined Vault name

	.PARAMETER user
    The Username of the authenticated User.

    .PARAMETER safe
    The name of the Safe containing the access marks to reset.

    .PARAMETER sessionID
    The ID number of the session. Use this parameter when working
    with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
	Reset-PVSafe -vault lab -user administrator -safe ORACLE

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
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath RESETSAFE $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}