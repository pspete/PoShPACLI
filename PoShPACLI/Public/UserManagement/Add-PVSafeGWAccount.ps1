# .ExternalHelp PoShPACLI-help.xml
function Add-PVSafeGWAccount {

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
		[string]$gwAccount
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand ADDSAFESHARE -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}