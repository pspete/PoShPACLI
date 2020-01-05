Function Remove-PVRule {

	<#
	.SYNOPSIS
	Deletes a service rule

	.DESCRIPTION
	Exposes the PACLI Function: "DELETERULE"

	.PARAMETER ruleID
	The unique ID of the rule to delete.

	.PARAMETER userName
	The user who will be affected by the rule.

	.PARAMETER safeName
	The Safe where the rule is applied.

	.PARAMETER fullObjectName
	The file, password, or folder that the rule applies to.

	.PARAMETER isFolder
	Whether the rule applies to files and passwords or for folders.
		NO – Indicates files and passwords
		YES – Indicates folders

	.EXAMPLE
	Remove-PVRule -ruleID 15 -userName kenny -safeName IDM `
	-fullObjectName root\IDMPass -isFolder:$false

	Deletes OLAC rule 15 from object

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$ruleID,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$userName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$safeName,

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[string]$fullObjectName,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[switch]$isFolder
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath DELETERULE $($PSBoundParameters |
			ConvertTo-ParameterString -donotQuote ruleID)



	}

}