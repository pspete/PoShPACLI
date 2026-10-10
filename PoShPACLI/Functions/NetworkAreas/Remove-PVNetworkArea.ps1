function Remove-PVNetworkArea {

	<#
	.SYNOPSIS
	Deletes a Network Area from the CyberArk Vault environment.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETENETWORKAREA"

	.PARAMETER networkArea
	The name of the Network Area to delete.

	.EXAMPLE
	Remove-PVNetworkArea -networkArea all\EU\UK

	Deletes Network Area UK from EU

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETENETWORKAREA -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}