Function Add-AreaAddress {

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
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$networkArea,
		[Parameter(Mandatory = $True)][string]$ipAddress,
		[Parameter(Mandatory = $False)][string]$ipMask,
		[Parameter(Mandatory = $True)][string]$toAddress,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDAREAADDRESS $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}