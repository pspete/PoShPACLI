Function Rename-PVSafe {

	<#
    .SYNOPSIS
    	Renames a Safe

    .DESCRIPTION
    	Exposes the PACLI Function: "RENAMESAFE"

    .PARAMETER vault
        The name of the Vault containing the Safe

    .PARAMETER user
        The Username of the User carrying out the task

    .PARAMETER safe
        The current name of the Safe.

    .PARAMETER newName
        The new name of the Safe.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Rename-PVSafe -vault lab -user administrator -safe oldName -newName newName

		Renames safe oldName to newName
    .NOTES
    	AUTHOR: Pete Maan

    #>

	[CmdLetBinding()]
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
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $False)]
		[string]$newName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		$Return = Invoke-PACLICommand $Script:PV.ClientPath RENAMESAFE $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString)

		if($Return.ExitCode -eq 0) {

			Write-Verbose "Safe Renamed to $newName"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}