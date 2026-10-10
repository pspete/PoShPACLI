function Rename-PVNetworkArea {

	<#
	.SYNOPSIS
	Renames an existing Network Area.

	.DESCRIPTION
	Exposes the PACLI Function: "RENAMENETWORKAREA"

	.PARAMETER networkArea
	The name of the Network Area.

	.PARAMETER newName
	The new name of the Network Area.

	.EXAMPLE
	Rename-PVNetworkArea -networkArea All\EMEA -newName All\EU

	Renames network area EMEA to EU

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdletBinding()]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newName
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand RENAMENETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}