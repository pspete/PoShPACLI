Function New-PVNetworkArea {

	<#
    .SYNOPSIS
    	Adds a new Network Area to the CyberArk Vault environment.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDNETWORKAREA"

    .PARAMETER vault
        The defined Vault name

    .PARAMETER user
        The Username of the authenticated User.

    .PARAMETER networkArea
        The name of the new Network Area.

    .PARAMETER securityLevelParm
        The level of the Network Area security flags.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		New-PVNetworkArea -vault Lab -user administrator -networkArea All\EMEA

		Adds EMEA Network Area

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
			ValueFromPipelineByPropertyName = $False)]
		[string]$networkArea,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[ValidateRange(1, 63)]
		[int]$securityLevelParm,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath ADDNETWORKAREA $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote securityLevelParm)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "Network Area $networkArea Created"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}