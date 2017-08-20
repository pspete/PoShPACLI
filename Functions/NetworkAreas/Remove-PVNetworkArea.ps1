Function Remove-PVNetworkArea {

	<#
    .SYNOPSIS
    	Deletes a Network Area from the CyberArk Vault environment.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETENETWORKAREA"

    .PARAMETER vault
        The name of the Vault from which the Network Area will be deleted.

    .PARAMETER user
        The name of the User carrying out the task.

    .PARAMETER networkArea
        The name of the Network Area to delete.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVNetworkArea -vault Lab -user administrator -networkArea all\EU\UK

		Deletes Network Area UK from EU

    .NOTES
    	AUTHOR: Pete Maan
		LASTEDIT: August 2017
	#>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$networkArea,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETENETWORKAREA $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Network Area $networkArea Deleted"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}