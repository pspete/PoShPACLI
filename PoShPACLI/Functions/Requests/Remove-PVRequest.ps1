Function Remove-PVRequest {

	<#
	.SYNOPSIS
	Removes a request from the requests list. If the request is removed from
	the MY_REQUEST list, it is deleted. If it is removed from the
	INCOMING_REQUEST list, the user who issued this function will not be able
	to see it, but other authorized users will be able to.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEREQUEST"

	.PARAMETER safe
	The name of the Safe for which the request has been created.

	.PARAMETER requestID
	The unique ID number of the request.

	.EXAMPLE
	Remove-PVRequest -safe Admin_Safe -requestID 2

	Deletes request from My_Request list

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[int]$requestID
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEREQUEST $($PSBoundParameters |
			ConvertTo-ParameterString -doNotQuote requestID)



	}

}