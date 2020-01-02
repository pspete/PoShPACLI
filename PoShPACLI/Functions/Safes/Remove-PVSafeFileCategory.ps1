Function Remove-PVSafeFileCategory {

	<#
    .SYNOPSIS
    Deletes a File Category at Safe level.

    .DESCRIPTION
    Exposes the PACLI Function: "DELETESAFEFILECATEGORY"

    .PARAMETER safe
    The Safe where the File Categories is defined.

    .PARAMETER category
	The name of the File Category to delete.

    .EXAMPLE
	Remove-PVSafeFileCategory -safe EU_Infra -category CISOcat1

	Deletes CISOcat1 file category from EU_Infra safe

    .NOTES
    AUTHOR: Pete Maan

    #>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[String]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("CategoryName")]
		[string]$category
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETESAFEFILECATEGORY $($PSBoundParameters | ConvertTo-ParameterString)



	}

}