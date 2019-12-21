Function Get-PVHttpGwUrl {

	<#
	.SYNOPSIS
	Retrieves the HTTP Gateway URL for a file in the Safe.
	Note: This command is no longer supported in version 5.5.

	.DESCRIPTION
	Exposes the PACLI Function: "GETHTTPGWURL"

	.PARAMETER safe
	The name of the Safe that contains the file.

	.PARAMETER folder
	The name of the folder where the file is stored.

	.PARAMETER file
	The name of the specified file.

	.EXAMPLE
	Get-PVHttpGwUrl -safe DEV -folder Root -file TeamPass

	Retrieves the HTTP Gateway URL for file TeamPass in the DEV Safe.

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

		#execute pacli
		$Return = Invoke-PACLICommand $Script:PV.ClientPath GETHTTPGWURL "$($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

				#Output Object
				[PSCustomObject] @{

					"URL" = $Results[0]

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI.URL

			}

		}

	}

}