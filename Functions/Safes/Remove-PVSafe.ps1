Function Remove-PVSafe {

	<#
    .SYNOPSIS
    	Delete a Safe. It is only possible to delete a Safe after the version
        retention period has expired for all files contained in the Safe.
        In order to carry out this command successfully, the Safe must be open.

    .DESCRIPTION
        Exposes the PACLI Function: "DELETESAFE"
        A deleted Safe cannot be recovered, make sure that any files that are stored
        within it are not required as they will be deleted.
    	A detailed description of the function or script. This keyword can be
    	used only once in each topic.

    .PARAMETER vault
        The name of the Vault containing the Safe to delete.

    .PARAMETER user
        The Username of the User carrying out the task

    .PARAMETER safe
        The name of the Safe to delete.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Remove-PVSafe -vault lab -user administrator -safe Old_Safe

		Deletes safe Old_Safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
	param(
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$vault,
		[Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$safe,
		[Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $True)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETESAFE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Deleted Safe $safe"

		}

	}

}