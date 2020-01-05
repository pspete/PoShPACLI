Function Remove-PVFolder {

	<#
	.SYNOPSIS
	Deletes a folder from an open Safe. A folder can only be deleted if the
	Safe History retention period has expired for all activity in the folder.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEFOLDER"

	.PARAMETER safe
	The name of the Safe in which the folder will be deleted.

	.PARAMETER folder
	The name of the folder to delete.

	.EXAMPLE
	Remove-PVFolder -safe Reports -folder root\2017

	Deletes folder "2017" from Reports safe
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

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEFOLDER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}