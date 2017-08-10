Function Add-SafeShare {

	<#
    .SYNOPSIS
    	Shares a Safe through a Gateway account

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDSAFESHARE"

    .PARAMETER vault
	   The name of the Vault to which the User has access.

    .PARAMETER user
	   The Username of the User carrying out the task.

    .PARAMETER safe
	   The Safe to share through the Gateway

    .PARAMETER gwAccount
	   The name of the Gateway account through which the Safe is shared

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $True)][string]$gwAccount,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDSAFESHARE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			Write-Verbose "Error Sharing Safe: $safe"
			$FALSE

		}

		else {

			Write-Verbose "$safe Shared via $gwAccount"
			$TRUE

		}

	}

}