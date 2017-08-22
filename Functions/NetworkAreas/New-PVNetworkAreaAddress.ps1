Function New-PVNetworkAreaAddress {

	<#
    .SYNOPSIS
    	Adds an IP address to an existing Network Area.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDAREAADDRESS"

    .PARAMETER vault
        The name of the Vault in which the Network Area is defined.

    .PARAMETER user
        The name of the User carrying out the task.

    .PARAMETER networkArea
        The name of the Network Area to which to add an IP address

    .PARAMETER ipAddress
        The IP address to add to the Network Area.

    .PARAMETER ipMask
        The first IP address in the IP mask to add to the Network Area.

    .PARAMETER toAddress
        The final IP address in the mask of the Network Area.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		New-PVNetworkAreaAddress -vault Lab -user administrator -networkArea All\EMEA -ipAddress 192.168.0.1 -toAddress 192.168.0.254

		Adds address range to EMEA Network Area

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
		[Parameter(Mandatory = $False)][string]$ipMask,
		[Parameter(Mandatory = $True)][string]$toAddress,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDAREAADDRESS $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -doNotQuote ipAddress, ipMask, toAddress)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Address Added to Network Area $networkArea"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}