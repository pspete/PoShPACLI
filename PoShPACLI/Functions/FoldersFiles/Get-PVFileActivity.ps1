Function Get-PVFileActivity {

	<#
	.SYNOPSIS
	Inspect activity that has taken place in a specified Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "INSPECTFILE"

	.PARAMETER safe
	The name of the Safe containing the file.

	.PARAMETER folder
	The folder containing the file whose activity will be listed.

	.PARAMETER file
	The name of the file or password whose activity will be listed.

	.PARAMETER logDays
	The number of days to include in the list of activities.

	.EXAMPLE
	Get-PVFileActivity -safe PROD -folder root -file prodpass

	Lists file activity for prodpass in safe PROD

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
		[int]$logDays
	)

	PROCESS {

		#execute pacli
		$Return = Invoke-PACLICommand $Script:PV.ClientPath INSPECTFILE "$($PSBoundParameters | ConvertTo-ParameterString -donotQuote logDays) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 7) {

					#Get Range from array
					$values = $Results[$i..($i + 7)]

					#Output Object
					[PSCustomObject] @{

						"Time"             = $values[0]
						"Username"         = $values[1]
						"Activity"         = $values[2]
						"PreviousLocation" = $values[3]
						"RequestID"        = $values[4]
						"RequestReason"    = $values[5]
						"Code"             = $values[6]
						"Safename"         = $safe
						"Folder"           = $folder
						"Filename"         = $file

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.File.Activity

				}

			}

		}

	}

}