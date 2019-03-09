Function Remove-PVNetworkArea {

	<#
    .SYNOPSIS
    	Deletes a Network Area from the CyberArk Vault environment.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETENETWORKAREA"

    .PARAMETER vault
        The name of the Vault from which the Network Area will be deleted.

    .PARAMETER user
        The name of the User carrying out the task.

    .PARAMETER networkArea
        The name of the Network Area to delete.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVNetworkArea -vault Lab -user administrator -networkArea all\EU\UK

		Deletes Network Area UK from EU

    .NOTES
    	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$vault,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath DELETENETWORKAREA $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "Network Area $networkArea Deleted"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}