Function Get-PVHttpGwUrl {

	<#
    .SYNOPSIS
    	Retrieves the HTTP Gateway URL for a file in the Safe.
        Note: This command is no longer supported in version 5.5.

    .DESCRIPTION
    	Exposes the PACLI Function: "GETHTTPGWURL"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The name of the user carrying out the task.

    .PARAMETER safe
        The name of the Safe that contains the file.

    .PARAMETER folder
        The name of the folder where the file is stored.

    .PARAMETER file
        The name of the specified file.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	Get-PVHttpGwUrl -vault Lab -user administrator -safe DEV -folder Root -file TeamPass

		Retrieves the HTTP Gateway URL for file TeamPass in the DEV Safe.

    .NOTES
    	AUTHOR: Pete Maan

    #>

	[CmdLetBinding()]
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
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Filename")]
		[string]$file,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(Test-PACLI) {

			#$PACLI variable set to executable path

			#execute pacli
			$Return = Invoke-PACLICommand $pacli GETHTTPGWURL "$($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

			if($Return.ExitCode) {

				Write-Error $Return.StdErr

			}

			else {

				#if result(s) returned
				if($Return.StdOut) {

					#Convert Output to array
					$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

					#Output Object
					[PSCustomObject] @{

						"URL" = $Results[0]

					} | Add-ObjectDetail -DefaultProperties URL -PropertyToAdd @{
						"vault"     = $vault
						"user"      = $user
						"sessionID" = $sessionID
					}

				}

			}

		}

	}

}