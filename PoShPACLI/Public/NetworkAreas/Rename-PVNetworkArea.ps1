# .ExternalHelp PoShPACLI-help.xml
function Rename-PVNetworkArea {

	[CmdletBinding()]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$newName
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand RENAMENETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}