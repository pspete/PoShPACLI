# .ExternalHelp PoShPACLI-help.xml
function Set-PVUserPassword {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$newPassword
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand SETPASSWORD -SecretParameters $PSBoundParameters -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}