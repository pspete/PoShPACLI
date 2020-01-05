Function Restore-PVFolder {

	<#
	.SYNOPSIS
	Undeletes a deleted folder in a Safe. A folder can only be undeleted if
	the Safe History retention period has not expired for all activity in
	the folder.

	.DESCRIPTION
	Exposes the PACLI Function: "UNDELETEFOLDER"

	.PARAMETER safe
	The name of the Safe in which the folder will be undeleted.

	.PARAMETER folder
	The name of the folder to undelete.

	.EXAMPLE
	Restore-PVFolder -safe ASIAPAC -folder root\MFA

	Restores deleted MFA Folder to ASIAPAC safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
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

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath UNDELETEFOLDER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}