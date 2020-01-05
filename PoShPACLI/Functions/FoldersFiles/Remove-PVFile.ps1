Function Remove-PVFile {

	<#
	.SYNOPSIS
	Deletes a file or password from the specified Safe. As versions of
	the file or password have been stored in the Safe, it can be undeleted
	at a later time if necessary.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEFILE"

	.PARAMETER safe
	The name of the Safe containing the file to delete.

	.PARAMETER folder
	The folder in which the file is located.

	.PARAMETER file
	The name of the file or password to delete.

	.EXAMPLE
	Remove-PVFile -safe ORACLE -folder root -file SYSTEM

	Deletes file from safe

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
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Filename")]
		[string]$file
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEFILE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}