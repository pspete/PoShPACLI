# .ExternalHelp PoShPACLI-help.xml
function Connect-PVVault {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$user,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$newPassword,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$logonFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$autoChangePassword,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$failIfConnected,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$radius
	)

	process {

		#deal with password SecureString
		if ($PSBoundParameters.ContainsKey("password")) {

			Write-Warning "Password is passed to PACLI in clear text on the process command line. Use a logon file to avoid exposure."

		}



		$Return = Invoke-PACLICommand -PacliCommand LOGON -SecretParameters $PSBoundParameters -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString -NoUser)

		if ($Return.ExitCode -eq 0) {

			Set-PVConfiguration -user $user

		}

	}

}