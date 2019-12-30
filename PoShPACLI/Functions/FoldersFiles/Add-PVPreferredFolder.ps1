Function Add-PVPreferredFolder {

	<#
	.SYNOPSIS
	Enables specification of a preferred folder in a Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "ADDPREFERREDFOLDER"

	.PARAMETER safe
	The name of the Safe containing the folder to mark.

	.PARAMETER folder
	The name of the folder to mark as a preferred folder.

	.EXAMPLE
	Add-PVPreferredFolder -safe AuditReports -folder root\reports\2017

	Sets preferred folder in AuditReports safe.

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
		[string]$folder
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDPREFERREDFOLDER $($PSBoundParameters | ConvertTo-ParameterString)
	}

}