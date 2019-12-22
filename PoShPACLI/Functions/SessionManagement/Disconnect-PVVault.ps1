Function Disconnect-PVVault {

	<#
	.SYNOPSIS
	This command enables log off from the Vault

	.DESCRIPTION
	Exposes the PACLI Function: "LOGOFF"

	.EXAMPLE
	Disconnect-PVVault

	Logs off from vault

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param()

	PROCESS {
		$Return = Invoke-PACLICommand $Script:PV.ClientPath LOGOFF $($PSBoundParameters | ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			$Script:PV.PSObject.Properties.Remove('user')

		}
	}

}
