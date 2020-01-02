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

    .PARAMETER safe
    The name of the Safe to delete.

    .EXAMPLE
    Remove-PVSafe -safe Old_Safe

	Deletes safe Old_Safe

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETESAFE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}