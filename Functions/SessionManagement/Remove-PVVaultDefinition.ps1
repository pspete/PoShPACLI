Function Remove-PVVaultDefinition {

	<#
    .SYNOPSIS
    	Deletes a Vault definition

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEVAULT"

    .PARAMETER vault
        The name of the Vault to delete.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVVaultDefinition -vault "Demo Vault"

		Deletes "Demo Vault" vault definition.

	.NOTES
		No longer supported from version 5.5

    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEVAULT $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Definition for Vault $vault Deleted"

		}

	}

}