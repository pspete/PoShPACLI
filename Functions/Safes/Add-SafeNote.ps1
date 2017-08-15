Function Add-SafeNote {

	<#
    .SYNOPSIS
    	Adds a note to the specified Safe

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDNOTE"

    .PARAMETER vault
        The name of the Vault containing the Safe to which to add a note.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The Safe to which to add a note.

    .PARAMETER subject
        The subject title of the note.

    .PARAMETER text
        The content of the note.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Add-SafeNote -vault Lab -user administrator -safe xxTest -subject "New Note" -text "Things worth noting..."

		Adds a safe note to safe xxTest

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][String]$safe,
		[Parameter(Mandatory = $False)][String]$subject,
		[Parameter(Mandatory = $False)][String]$text,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-ExePreReqs)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDNOTE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Debug $Return.StdErr
			$FALSE

		}

		else {

			$TRUE

		}

	}

}