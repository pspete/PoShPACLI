Function New-PVSafeFileCategory {

	<#
    .SYNOPSIS
    	Adds File Categories at Safe level

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDSAFEFILECATEGORY"

    .PARAMETER vault
        The name of the Vault containing the Safe where the File Category will
        be added.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The Safe where the File Category will be added.

    .PARAMETER category
        The name of the File Category.

    .PARAMETER type
        The type of File Category.
        Valid values for this parameter are:
            cat_text – a textual value
            cat_numeric – a numeric value
            cat_list – a list value

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
    	New-PVSafeFileCategory -vault Lab -user administrator -safe EU_Support -category NewCat1 -type cat_text

		Adds text type category NewCat1 to EU_Support safe

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: August 2017
    #>

	[CmdLetBinding(SupportsShouldProcess)]
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
			ValueFromPipelineByPropertyName = $False)]
		[string]$category,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[ValidateSet("cat_text", "cat_numeric", "cat_list")]
		[String]$type,

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


	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli ADDSAFEFILECATEGORY $($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString -donotQuote type)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		elseif($Return.ExitCode -eq 0) {

			Write-Verbose "Added Safe File Category $category"

			[PSCustomObject] @{

				"vault"     = $vault
				"user"      = $user
				"sessionID" = $sessionID

			} | Add-ObjectDetail -TypeName pacli.PoShPACLI

		}

	}

}