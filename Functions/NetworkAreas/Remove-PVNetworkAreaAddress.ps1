Function Remove-PVNetworkAreaAddress {

	<#
    .SYNOPSIS
    	Deletes an IP address from an existing Network Area.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETEAREAADDRESS"

    .PARAMETER vault
        The name of the Vault in which the Network Area is defined.

    .PARAMETER user
        The name of the User carrying out the task.

    .PARAMETER networkArea
        The name of the Network Area from which to delete an IP address

    .PARAMETER ipAddress
        The IP address to delete from the Network Area.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVNetworkAreaAddress -vault lab -user administrator -networkArea all\VPN -ipAddress 20.54.118.55

		Deletes Area address 20.54.118.55 from VPN network area

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$networkArea,
		[Parameter(Mandatory = $True)][string]$ipAddress,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEAREAADDRESS $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Address $ipAddress Removed from Network Area $networkArea"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}