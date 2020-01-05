Function Remove-PVPreferredFolder {

	<#
	.SYNOPSIS
	Deletes a preferred folder from a Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEPREFFEREDFOLDER"

	.PARAMETER safe
	The name of the Safe containing the preferred folder.

	.PARAMETER folder
	The name of the preferred folder to delete.

	.EXAMPLE
	Remove-PVPreferredFolder -safe Reports -folder root\reports

	Deletes preferred folder

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEPREFERREDFOLDER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}