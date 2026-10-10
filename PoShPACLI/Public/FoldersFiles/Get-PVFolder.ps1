# .ExternalHelp PoShPACLI-help.xml
function Get-PVFolder {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe
	)

	process {

		#execute pacli
		$Return = Invoke-PACLICommand -PacliCommand FOLDERSLIST -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

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

							'Folder'       = $values[0]
							'Accessed'     = $values[1]
							'History'      = $values[2]
							'DeletionDate' = $values[3]
							'DeletedBy'    = $values[4]
							'Safename'     = $safe

						} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Folder

					}

				}

			}

		}

	}

}