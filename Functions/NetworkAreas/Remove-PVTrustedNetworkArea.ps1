Function Remove-PVTrustedNetworkArea {

	<#
    .SYNOPSIS
    	Deletes a Trusted Network Area from a CyberArk Vault environment.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETETRUSTEDNETWORKAREA"

    .PARAMETER vault
	   The name of the Vault in which the Trusted Network Area is defined.

    .PARAMETER user
	   The name of the User carrying out the task.

    .PARAMETER trusterName
	   The User whose access to the Trusted Network Area will be removed.

    .PARAMETER networkArea
	   The name of the Trusted Network Area to delete.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Remove-PVTrustedNetworkArea -vault Lab -user administrator -trusterName cnAdmin -networkArea All\Vendor

		Deletes Trusted Network Area "Vendor" from cnAdmin account

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$trusterName,
		[Parameter(Mandatory = $True)][string]$networkArea,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETETRUSTEDNETWORKAREA $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Trusted Network Area $NetworkArea Removed from $trusterName"

		}

	}

}