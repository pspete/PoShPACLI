function Clear-PVSafeHistory {

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

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand CLEARSAFEHISTORY -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}