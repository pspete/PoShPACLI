Function Add-PVPasswordObject {

	<#
	.SYNOPSIS
	Stores a password object in the specified safe.

	.DESCRIPTION
	Exposes the PACLI Function: "STOREPASSWORDOBJECT"

	.PARAMETER safe
	The name of the Safe where the password object is stored

	.PARAMETER folder
	The name of the folder where the password object is stored.

	.PARAMETER file
	The name of the password object.

	.PARAMETER password
	The password being stored in the password object.

	.EXAMPLE
	Add-PVPasswordObject -safe Dev_Team -folder Root `
	-file devpass -password (read-host -AsSecureString)

	Adds password object with specified value to Dev_Team safe

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding()]
	param(

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
		[string]$file,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[securestring]$password
	)

	PROCESS {

		#deal with password SecureString
		if ($PSBoundParameters.ContainsKey("password")) {

			$PSBoundParameters["password"] = ConvertTo-InsecureString $password

		}

		$Null = Invoke-PACLICommand $Script:PV.ClientPath STOREPASSWORDOBJECT $($PSBoundParameters | ConvertTo-ParameterString)
	}

}