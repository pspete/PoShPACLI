Function New-PVFolder {

	<#
	.SYNOPSIS
	Adds a folder to the specified Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDFOLDER"

	.PARAMETER safe
	The name of the Safe to which to add the folder.

	.PARAMETER folder
	The name of the new folder.

	.EXAMPLE
	New-PVFolder -safe Reports -folder Root\AuditReports\2017

	Adds folder "2017" to the AuditReports folder under the Root location in safe "Reports"
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

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDFOLDER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}