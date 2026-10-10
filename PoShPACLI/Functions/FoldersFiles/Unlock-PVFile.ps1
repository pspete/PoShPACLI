function Unlock-PVFile {

	<#
	.SYNOPSIS
	Unlocks a file or password, enabling other Users to retrieve it.

	.DESCRIPTION
	Exposes the PACLI Function: "UNLOCKFILE"

	.PARAMETER safe
	The name of the Safe in which the file is stored.

	.PARAMETER folder
	The name of the folder in which the file is stored.

	.PARAMETER file
	The name of the file or password to unlock.

	.EXAMPLE
	Unlock-PVFile -safe Prod_Servers -folder root -file Adminpass

	Unlocks file Adminpass in safe Prod_Servers

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
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Filename")]
		[string]$file
	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand UNLOCKFILE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			[PSCustomObject] @{

				"Safename" = $safe
				"Folder"   = $folder
				"Filename" = $file

			}

		}

	}

}