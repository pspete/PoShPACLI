Function Close-PVSafe {

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

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath CLOSESAFE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}