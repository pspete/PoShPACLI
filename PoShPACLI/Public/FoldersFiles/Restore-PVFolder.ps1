# .ExternalHelp PoShPACLI-help.xml
function Restore-PVFolder {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand UNDELETEFOLDER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}