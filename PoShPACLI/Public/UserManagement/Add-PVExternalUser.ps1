# .ExternalHelp PoShPACLI-help.xml
function Add-PVExternalUser {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Username')]
		[string]$destUser,


		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('DN', 'distinguishedName')]
		[string]$ldapFullDN,


		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ldapDirectory,


		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$UpdateIfExists

	)

	process {

		$Return = Invoke-PACLICommand -PacliCommand ADDUPDATEEXTERNALUSERENTITY -CommandParameters "$($PSBoundParameters | ConvertTo-ParameterString) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Convert Output to array
				$Results = $Return.StdOut | ConvertFrom-PacliOutput

				If ($Results) {

					#Output Object
					[PSCustomObject] @{

						'Username' = $Results[0]

					} | Add-ObjectDetail -TypeName pacli.PoShPACLI.User.External

				}

			}

		}

	}

}