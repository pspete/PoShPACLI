Function Unlock-PVUser {

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

	[CmdLetBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath UNLOCK -SecretParameters $PSBoundParameters $($PSBoundParameters | ConvertTo-ParameterString)



	}

}