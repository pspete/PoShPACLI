# .ExternalHelp PoShPACLI-help.xml
function Unlock-PVUser {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand UNLOCK -SecretParameters $PSBoundParameters -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}