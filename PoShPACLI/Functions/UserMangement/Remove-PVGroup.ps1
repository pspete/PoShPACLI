Function Remove-PVGroup {

	<#
	.SYNOPSIS
	Deletes a CyberArk group from the Vault

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEGROUP"

	.PARAMETER group
	The name of the group to delete.

	.EXAMPLE
	Remove-PVGroup -group old_group

	Deletes group old_group from Vault.

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Groupname")]
		[string]$group
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEGROUP $($PSBoundParameters | ConvertTo-ParameterString)



	}

}