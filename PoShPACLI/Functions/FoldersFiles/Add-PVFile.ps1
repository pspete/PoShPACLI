Function Add-PVFile {

	<#
	.SYNOPSIS
	Stores a file, that is currently on your local computer, in a secure
	location in a Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "STOREFILE"

	.PARAMETER safe
	The name of the Safe where the file will be stored.

	.PARAMETER folder
	The folder in the Safe where the file will be stored.

	.PARAMETER file
	The name of the file as it will be stored in the Safe.

	.PARAMETER localFolder
	The location on the User's terminal where the file is currently
	located.

	.PARAMETER localFile
	The name of the file to be stored in the Vault as it is on the User’s
	terminal.

	.PARAMETER deleteMacros
	Delete macros from the file

	.EXAMPLE
	Add-PVFile -safe caTools -folder Root -file pacli.exe `
	-localFolder D:\PACLI -localFile pacli.exe

	Stores local file, pacli.exe in the caTools safe

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
		[string]$file,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFolder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$localFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$deleteMacros
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath STOREFILE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}