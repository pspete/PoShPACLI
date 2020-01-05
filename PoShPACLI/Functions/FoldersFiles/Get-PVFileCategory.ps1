Function Get-PVFileCategory {

	<#
	.SYNOPSIS
	Lists all the File Categories at both Vault and Safe level for the
	specified file or password.

	.DESCRIPTION
	Exposes the PACLI Function: "LISTFILECATEGORIES"

	.PARAMETER safe
	The name of the Safe that the File Category is attached to.

	.PARAMETER folder
	The folder containing a file with a File Category attached to it.

	.PARAMETER file
	The name of the file or password that is attached to a File Category.

	.PARAMETER category
	The name of the File Category.

	.EXAMPLE
	Get-PVFileCategory -safe DEV -folder Root -file TeamPass

	Lists file categories on file TeamPass in safe DEV.

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
		[string]$file,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$category
	)

	PROCESS {

		#execute pacli
		$Return = Invoke-PACLICommand $Script:PV.ClientPath LISTFILECATEGORIES "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 3) {

					#Get Range from array
					$values = $Results[$i..($i + 3)]

					#Output Object
					[PSCustomObject] @{

						"CategoryName"  = $values[0]
						"CategoryValue" = $values[1]
						"CategoryID"    = $values[2]
						"Safename"      = $safe
						"Folder"        = $folder
						"Filename"      = $file

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.File.Category

				}

			}

		}

	}

}