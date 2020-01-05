Function Rename-PVSafe {

	<#
	.SYNOPSIS
	Renames a Safe

	.DESCRIPTION
	Exposes the PACLI Function: "RENAMESAFE"

	.PARAMETER safe
	The current name of the Safe.

	.PARAMETER newName
	The new name of the Safe.

	.EXAMPLE
	Rename-PVSafe -safe oldName -newName newName

	Renames safe oldName to newName
	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newName
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath RENAMESAFE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}