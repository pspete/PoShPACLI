function Remove-PVLocation {

	<#
    .SYNOPSIS
	Deletes a Location

    .DESCRIPTION
    Exposes the PACLI Function: "DELETELOCATION"

    .PARAMETER location
    The name of the location to delete.
    Note: Add a backslash ‘\’ before the name of the location

    .EXAMPLE
	Remove-PVLocation -location \x51

	Deletes location "x51" from the vault

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdletBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$location
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand DELETELOCATION -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}