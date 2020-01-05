Function Remove-PVSafeOwner {

	<#
	.SYNOPSIS
	Deletes a Safe Owner, thus removing their permissions and authority to
	enter the Safe.
	In order to carry out this command successfully, the Safe must be open.

	.DESCRIPTION
	Exposes the PACLI Function: "DELETEOWNER"

	.PARAMETER owner
	The name of the Safe Owner to remove from the Vault.

	.PARAMETER safe
	The name of the Safe from which to remove the Safe Owner.

	.EXAMPLE
	Remove-PVSafeOwner -safe EU_Safe -owner user1

	Deletes user1 as a safe member on EU_Safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
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
		[Alias("Username")]
		[String]$owner
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEOWNER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}