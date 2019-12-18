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
	The defined Vault name

	.PARAMETER user
	The Username of the authenticated User.

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
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$requestID,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DELETEREQUEST $($PSBoundParameters.getEnumerator() |
			ConvertTo-ParameterString -doNotQuote requestID)

		if ($Return.ExitCode -eq 0) {

			

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}