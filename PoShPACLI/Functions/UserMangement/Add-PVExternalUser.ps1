Function Add-PVExternalUser {

	<#
	.SYNOPSIS
	Adds a new user from an external directory

	.DESCRIPTION
	Exposes the PACLI Function: "ADDUPDATEEXTERNALUSERENTITY"

	.PARAMETER destUser
	The name (samaccountname) of the external User or Group that will be created
	in the Vault.

	.PARAMETER ldapFullDN
	The full DN of the user in the external directory.

	.PARAMETER ldapDirectory
	The name of the external directory where the user or group is defined.

	.PARAMETER UpdateIfExists
	Whether or not existing external Users and Groups definitions will be updated
	in the Vault.

	.EXAMPLE
	Add-PVExternalUser -destUser admin01 -ldapDirectory PSPETE.DEV -UpdateIfExists

	Updates user admin01 in vault from domain PSPETE.DEV
	.NOTES
	AUTHOR: Pete Maan

	Work required to support LDAPFullDN & Parameter Validation / Parameter Sets
	#>

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$destUser,


		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("DN", "distinguishedName")]
		[string]$ldapFullDN,


		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapDirectory,


		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$UpdateIfExists

	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath ADDUPDATEEXTERNALUSERENTITY "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				#Output Object
				[PSCustomObject] @{

					"Username" = $Results

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI.User.External

			}

		}

	}

}