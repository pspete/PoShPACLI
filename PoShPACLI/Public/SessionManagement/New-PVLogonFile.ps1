# .ExternalHelp PoShPACLI-help.xml
function New-PVLogonFile {

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$logonFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$username,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand CREATELOGONFILE -SecretParameters $PSBoundParameters -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString -NoVault -NoUser)

	}

}