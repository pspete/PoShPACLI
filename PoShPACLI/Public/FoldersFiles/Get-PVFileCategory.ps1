# .ExternalHelp PoShPACLI-help.xml
function Get-PVFileCategory {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Filename')]
		[string]$file,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$category
	)

	process {

		#execute pacli
		$Return = Invoke-PACLICommand -PacliCommand LISTFILECATEGORIES -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = @($Return.StdOut | ConvertFrom-PacliOutput)

				#if records returned
				If ($Results) {

					#loop through results
					foreach ($values in $Results) {

						#Output Object
						[PSCustomObject] @{

							'CategoryName'  = $values[0]
							'CategoryValue' = $values[1]
							'CategoryID'    = $values[2]
							'Safename'      = $safe
							'Folder'        = $folder
							'Filename'      = $file

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.File.Category

					}

				}

			}

		}

	}

}