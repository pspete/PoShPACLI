Function Add-PVSafeGWAccount {

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
		[string]$gwAccount
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDSAFESHARE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}