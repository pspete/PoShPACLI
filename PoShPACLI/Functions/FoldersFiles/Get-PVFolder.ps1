Function Get-PVFolder {

	<#
	.SYNOPSIS
	Lists folders in the specified Safe.

	.DESCRIPTION
	Exposes the PACLI Function: "FOLDERSLIST"

	.PARAMETER safe
	The name of the Safe whose folders will be listed.

	.EXAMPLE
	Get-PVFolder -safe ORACLE

	Lists all folders in the specified safe.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	PROCESS {

		#execute pacli
		$Return = Invoke-PACLICommand $Script:PV.ClientPath FOLDERSLIST "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#loop through results
				For ($i = 0 ; $i -lt $Results.length ; $i += 5) {

					#Get Range from array
					$values = $Results[$i..($i + 5)]

					#Output Object
					[PSCustomObject] @{

						"Folder"       = $values[0]
						"Accessed"     = $values[1]
						"History"      = $values[2]
						"DeletionDate" = $values[3]
						"DeletedBy"    = $values[4]
						"Safename"     = $safe

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Folder

				}

			}

		}

	}

}