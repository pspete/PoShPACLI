Function Restore-PVFile {

	<#
	.SYNOPSIS
	Undelete a file or password that has been previously deleted.

	.DESCRIPTION
	Exposes the PACLI Function: "UNDELETEFILE"

	.PARAMETER safe
	The name of the Safe in which the file was stored.

	.PARAMETER folder
	The name of the folder in which the file was stored.

	.PARAMETER file
	The name of the file or password to undelete.

	.EXAMPLE
	Restore-PVFile -safe US_Region -folder root -file deletedFile

	"Un-deletes"/Restores deletedFile

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
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Filename")]
		[string]$file
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath UNDELETEFILE $($PSBoundParameters | ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			[PSCustomObject] @{

				"Safename" = $safe
				"Folder"   = $folder
				"Filename" = $file

			}

		}

	}

}