Function Get-PVFolder {

	<#
    .SYNOPSIS
    	Lists folders in the specified Safe.

    .DESCRIPTION
    	Exposes the PACLI Function: "FOLDERSLIST"

    .PARAMETER vault
        The name of the Vault containing the specified Safe.

    .PARAMETER user
        The Username of the User carrying out the task.

    .PARAMETER safe
        The name of the Safe whose folders will be listed.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVFolder -vault lab -user administrator -safe ORACLE

		Lists all folders in the specified safe.

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
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(Test-PACLI) {

			#$PACLI variable set to executable path

			#execute pacli
			$Return = Invoke-PACLICommand $pacli FOLDERSLIST "$($PSBoundParameters.getEnumerator() |
				ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

			if($Return.ExitCode) {

				Write-Error $Return.StdErr

			}

			else {

				#if result(s) returned
				if($Return.StdOut) {

					#Convert Output to array
					$Results = (($Return.StdOut | Select-String -Pattern "\S") | ConvertFrom-PacliOutput)

					#loop through results
					For($i = 0 ; $i -lt $Results.length ; $i += 5) {

						#Get Range from array
						$values = $Results[$i..($i + 5)]

						#Output Object
						[PSCustomObject] @{

							"FolderName"   = $values[0]
							"Accessed"     = $values[1]
							"History"      = $values[2]
							"DeletionDate" = $values[3]
							"DeletedBy"    = $values[4]

						} | Add-ObjectDetail -DefaultProperties Foldername, Accessed, History,
						DeletionDate, DeletedBy -PropertyToAdd @{
							"vault"     = $vault
							"user"      = $user
							"sessionID" = $sessionID
						}

					}

				}

			}

		}

	}

}