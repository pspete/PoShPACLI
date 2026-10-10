# .ExternalHelp PoShPACLI-help.xml
function Get-PVPasswordObject {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Safename')]
		[string]$safe,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$folder,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias('Filename')]
		[string]$file,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$lockFile,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$evenIfLocked,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('REQUEST_AND_USE', 'CHECK_DONT_USE', 'USE_ONLY')]
		[string]$requestUsageType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[ValidateSet('SINGLE', 'MULTIPLE')]
		[string]$requestAccessType,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$usableFrom,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$usableTo,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$requestReason,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("userRequest")]
		[switch]$useRequest,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$sendRequest,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$executeRequest,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$internalName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $False)]
		[switch]$AsSecureString
	)

	process {

		$null = $PSBoundParameters.Remove('AsSecureString')

		$Return = Invoke-PACLICommand -PacliCommand RETRIEVEPASSWORDOBJECT -CommandParameters "$($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote requestUsageType,requestAccessType) OUTPUT (ALL,ENCLOSE)"

		if ($Return.ExitCode -eq 0) {

			#if result(s) returned
			if ($Return.StdOut) {

				#Parse inline; passing the value to another command records it in pipeline execution logs
				$Value = $Return.StdOut.Trim()

				If ($Value -match '(?s)^".*"$') {

					$Value = $Value.Substring(1, $Value.Length - 2)

				}

				If ($Value) {

					If ($AsSecureString) {

						$Value = [System.Net.NetworkCredential]::new('', $Value).SecurePassword

					}

					#Output Object
					$Password = [PSCustomObject] @{

						'Password' = $Value

					}

					$Password.PSObject.TypeNames.Insert(0, 'pacli.PoShPACLI.Password')

					$Password

				}

			}

		}

	}

}