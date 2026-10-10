function Add-PVSafeGWAccount {

	<#
	.SYNOPSIS
	Shares a Safe through a Gateway account

	.DESCRIPTION
	Exposes the PACLI Function: "ADDSAFESHARE"

	.PARAMETER safe
	The Safe to share through the Gateway

	.PARAMETER gwAccount
	The name of the Gateway account through which the Safe is shared

	.EXAMPLE
	Add-PVSafeGWAccount -safe Team_Safe -gwAccount PVWAGWUser

	Adds Gateway account PVWAGWUser to shared safe Team_Safe.

	.NOTES
	AUTHOR: Pete Maan

	#>

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