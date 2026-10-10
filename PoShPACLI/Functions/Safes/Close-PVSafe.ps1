function Close-PVSafe {

	<#
	.SYNOPSIS
	Closes a Safe

	.DESCRIPTION
	Exposes the PACLI Function: "CLOSESAFE"

	.PARAMETER safe
	The name of the Safe to close.

	.EXAMPLE
	Close-PVSafe -safe system

	Closes the SYSTEM safe

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

		$Null = Invoke-PACLICommand -PacliCommand CLOSESAFE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}