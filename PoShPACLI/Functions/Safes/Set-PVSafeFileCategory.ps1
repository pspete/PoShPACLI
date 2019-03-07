Function Set-PVSafeFileCategory {

	<#
    .SYNOPSIS
    	Update an existing File Category at Safe level

    .DESCRIPTION
    	Exposes the PACLI Function: "UPDATESAFEFILECATEGORY"

    .PARAMETER vault
        The name of the Vault containing the Safe where the File Category is
        defined.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The Safe where the File Categories will be updated.

    .PARAMETER category
        The current name of the File Category.

    .PARAMETER categoryNewName
        The new name of the File Category.

    .PARAMETER validValues
        The valid values for the File Category.

    .PARAMETER defaultValue
        The default value for the File Category.

    .PARAMETER required
        Whether or not the File Category is a requirement when storing a file in
        the Safe.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Set-PVSafeFileCategory -vault lab -user administrator -safe SAFEName -category criticality `
		-categoryNewName sev -validValues "1,2,3,4"

		Changes Safe File Category name from "Criticality" to "sev"

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
		[Alias("Safename")]
		[String]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$category,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[String]$categoryNewName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[String]$validValues,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[String]$defaultValue,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$required,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(Test-PACLI) {

			#$PACLI variable set to executable path

			$Return = Invoke-PACLICommand $pacli UPDATESAFEFILECATEGORY $($PSBoundParameters.getEnumerator() |
					ConvertTo-ParameterString)

			if($Return.StdErr) {

				Write-Error $Return.StdErr

			}

			elseif($Return -match "True") {

				Write-Verbose "Safe File Category Updated"

				[PSCustomObject] @{

					"vault"     = $vault
					"user"      = $user
					"sessionID" = $sessionID

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI

			}

		}

	}

}