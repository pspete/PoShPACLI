# .ExternalHelp PoShPACLI-help.xml
function Add-PVGroupMember {

	[CmdletBinding()]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Groupname")]
		[string]$group,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Username")]
		[string]$member
	)

	process {

		$Null = Invoke-PACLICommand -PacliCommand ADDGROUPMEMBER -CommandParameters ($PSBoundParameters | ConvertTo-ParameterString)



	}

}