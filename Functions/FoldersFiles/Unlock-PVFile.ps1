Function Unlock-PVFile {

	<#
    .SYNOPSIS
    	Unlocks a file or password, enabling other Users to retrieve it.

    .DESCRIPTION
    	Exposes the PACLI Function: "UNLOCKFILE"

    .PARAMETER vault
        The name of the Vault in which the file is stored.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe in which the file is stored.

    .PARAMETER folder
        The name of the folder in which the file is stored.

    .PARAMETER file
        The name of the file or password to unlock.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Unlock-PVFile -vault lab -user administrator -safe Prod_Servers -folder root -file Adminpass

		Unlocks file Adminpass in safe Prod_Servers

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
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
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$file,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli UNLOCKFILE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "$file Unlocked"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}