# .ExternalHelp PoShPACLI-help.xml
function Get-PVSafeEvent {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safePatternName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$sourceIDList,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$eventTypeIDList,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[datetime]$fromDate,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[string]$dataSubstring,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[int]$numOfEvents,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$caseSensitive
	)

	process {

		if ($PSBoundParameters.ContainsKey("fromDate")) {

			$PSBoundParameters["fromDate"] = (Get-Date $($PSBoundParameters["fromDate"]) -Format dd/MM/yyyy)

		}

		$Return = Invoke-PACLICommand -PacliCommand SAFEEVENTSLIST -CommandParameters "$($PSBoundParameters |
            ConvertTo-ParameterString -donotQuote numOfEvents) OUTPUT (ALL,ENCLOSE)"

		#If data returned
		if ($Return.StdOut) {

			#Each record is returned as an array of values
			foreach ($Values in @($Return.StdOut | ConvertFrom-PacliOutput)) {

				#Output Object
				[PSCustomObject] @{

					"Safename"       = $Values[0]
					"SafeID"         = $Values[1]
					"EventID"        = $Values[2]
					"SourceID"       = $Values[3]
					"EventTypeID"    = $Values[4]
					"CreationDate"   = $Values[5]
					"ExpirationDate" = $Values[6]
					"Username"       = $Values[7]
					"UserID"         = $Values[8]
					"AgentName"      = $Values[9]
					"AgentID"        = $Values[10]
					"ClientID"       = $Values[11]
					"Version"        = $Values[12]
					"FromIP"         = $Values[13]
					"Data"           = $Values[14]

				} | Add-ObjectDetail -TypeName pacli.PoShPACLI.Safe.Event

			}

		}

	}

}
