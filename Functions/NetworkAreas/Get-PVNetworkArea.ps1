Function Get-PVNetworkArea {

	<#
    .SYNOPSIS
    	Lists all of the Network Areas that are defined in the Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "NETWORKAREASLIST"

    .PARAMETER vault
        The name of the Vault in which the Network Area is defined.

    .PARAMETER user
        The name of the User carrying out the task.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
		Get-PVNetworkArea -vault lab -user administrator

		Lists all network areas

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
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$sessionID
	)

	PROCESS {

		If(Test-PACLI) {

			#$PACLI variable set to executable path

			#execute pacli with parameters
			$Return = Invoke-PACLICommand $pacli NETWORKAREASLIST "$($PSBoundParameters.getEnumerator() |
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
					For($i = 0 ; $i -lt $Results.length ; $i += 2) {

						#Get Range from array
						$values = $Results[$i..($i + 2)]

						#Output Object
						[PSCustomObject] @{

							"Name"          = $values[0]
							"SecurityLevel" = $values[1]

						} | Add-ObjectDetail -DefaultProperties Name, SecurityLevel -PropertyToAdd @{
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