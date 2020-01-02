Function Clear-PVSafeHistory {

	<#
	.SYNOPSIS
	Clears the history of all activity in the specified open Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "CLEARSAFEHISTORY"

	.PARAMETER safe
	The name of the Safe to clear.

	.EXAMPLE
	Clear-PVSafeHistory -safe system

	Clears safe history on the SYSTEM safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath CLEARSAFEHISTORY $($PSBoundParameters | ConvertTo-ParameterString)



	}

}