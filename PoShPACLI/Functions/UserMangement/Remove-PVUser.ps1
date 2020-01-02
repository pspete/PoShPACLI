Function Remove-PVUser {

	<#
    .SYNOPSIS
    Enables a User with the appropriate authority to delete a CyberArk User.

    .DESCRIPTION
	Exposes the PACLI Function: "DELETEUSER"

    .PARAMETER destUser
    The name of the User to be deleted.

    .EXAMPLE
	Remove-PVUser -destUser quitter

	Deletes vault user "quitter"

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$destUser
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETEUSER $($PSBoundParameters | ConvertTo-ParameterString)



	}

}