function Unlock-PVUser {

	<#
    .SYNOPSIS
    Unlocks the User account of the CyberArk User who is currently logged on.

    .DESCRIPTION
    Exposes the PACLI Function: "UNLOCK"

    .PARAMETER password
    The User’s password

    .EXAMPLE
	Unlock-PVUser -password (read-host -AsSecureString)

	Unlocks the current user, after supplying password for the account.

    .NOTES
    AUTHOR: Pete Maan

    #>

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