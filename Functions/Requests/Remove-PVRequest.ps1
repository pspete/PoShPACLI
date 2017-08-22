Function Remove-PVRequest {

	<#
    .SYNOPSIS
    	Removes a request from the requests list. If the request is removed from
        the MY_REQUEST list, it is deleted. If it is removed from the
        INCOMING_REQUEST list, the user who issued this function will not be able
        to see it, but other authorized users will be able to.

    .DESCRIPTION
        Exposes the PACLI Function: "DELETEREQUEST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe for which the request has been created.

    .PARAMETER requestID
        The unique ID number of the request.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Remove-PVRequest -vault Lab -user Requestor -safe Admin_Safe -requestID 2

		Deletes request from Requestor's My_Request list

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][int]$requestID,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEREQUEST $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -doNotQuote requestID)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Request $RequestID Deleted"



		}

	}

}