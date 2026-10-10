# .ExternalHelp PoShPACLI-help.xml
function Reset-PVFile {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
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

		$Return = Invoke-PACLICommand -PacliCommand RESETFILE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)

		if ($Return.ExitCode -eq 0) {

			[PSCustomObject] @{

				"Safename" = $safe
				"Folder"   = $folder
				"Filename" = $file

			}

		}

	}

}