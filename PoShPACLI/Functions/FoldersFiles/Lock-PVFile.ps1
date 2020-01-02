Function Lock-PVFile {

	<#
	.SYNOPSIS
	Locks a file or password, preventing other Users from retrieving it.

	.DESCRIPTION
	Exposes the PACLI Function: "LOCKFILE"

	.PARAMETER safe
	The name of the Safe in which the file is stored.

	.PARAMETER folder
	The name of the folder in which the file is stored.

	.PARAMETER file
	The name of the file or password to lock.

	.EXAMPLE
	Lock-PVFile -safe ORACLE -folder root -file SYSpass

	Locks file SYSpass in ORACLE safe.

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

		$Return = Invoke-PACLICommand $Script:PV.ClientPath LOCKFILE $($PSBoundParameters | ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			[PSCustomObject] @{

				"Safename" = $safe
				"Folder"   = $folder
				"Filename" = $file

			}

		}

	}

}