Function Remove-PVSafeFileCategory {

	<#
    .SYNOPSIS
    	Deletes a File Category at Safe level.

    .DESCRIPTION
    	Exposes the PACLI Function: "DELETESAFEFILECATEGORY"

    .PARAMETER vault
        The name of the Vault containing the Safe where the File Category is
        defined.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The Safe where the File Categories is defined.

    .PARAMETER category
        The name of the File Category to delete.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Remove-PVSafeFileCategory -vault lab -user administrator -safe EU_Infra -category CISOcat1

		Deletes CISOcat1 file category from EU_Infra safe

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
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[String]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("CategoryName")]
		[string]$category,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(Test-PACLI) {

			#$PACLI variable set to executable path

			$Return = Invoke-PACLICommand $pacli DELETESAFEFILECATEGORY $($PSBoundParameters.getEnumerator() |
					ConvertTo-ParameterString)

			if($Return.ExitCode) {

				Write-Error $Return.StdErr

			}

			elseif($Return.ExitCode -eq 0) {

				Write-Verbose "Deleted Safe File Category $category"

				[PSCustomObject] @{

					"vault"     = $vault
					"user"      = $user
					"sessionID" = $sessionID

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI

			}

		}

	}

}