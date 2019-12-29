Function Get-PVConfiguration {
	<#
	.SYNOPSIS
	Gets variable value from the script scope which holds default values for PACLI operations.

	.DESCRIPTION
	Gets properties from variable in the script scope which used by module functions to provide default values for required parameters.

	.EXAMPLE
	Get-PVConfiguration 

	Returns current values for ClientPath, sessionID, vault & user being used by module functions.  

	#>
	[CmdletBinding(SupportsShouldProcess)]
	Param()

	Begin { }

	Process {
		
		Get-Variable -Name PV -Scope Script -ValueOnly

	}

	End { }

}