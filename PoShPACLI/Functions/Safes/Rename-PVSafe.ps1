function Rename-PVSafe {

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

	[CmdletBinding()]
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

	process {

		$Null = Invoke-PACLICommand -PacliCommand RENAMESAFE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}