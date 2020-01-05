Function Set-PVSafeNote {

	<#
	.SYNOPSIS
	Adds a note to the specified Safe

	.DESCRIPTION
	Exposes the PACLI Function: "ADDNOTE"

	.PARAMETER safe
	The Safe to which to add a note.

	.PARAMETER subject
	The subject title of the note.

	.PARAMETER text
	The content of the note.

	.EXAMPLE
	Set-PVSafeNote -safe xxTest -subject "New Note" -text "Things worth noting..."

	Adds a safe note to safe xxTest

	.NOTES
	AUTHOR: Pete Maan

	#>

	[CmdLetBinding(SupportsShouldProcess)]
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "ShouldProcess handling is in Invoke-PACLICommand")]
	param(

		[Parameter(
			Mandatory = $True,
			ValueFromPipelineByPropertyName = $True)]
		[Alias("Safename")]
		[string]$safe,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[String]$subject,

		[Parameter(
			Mandatory = $False,
			ValueFromPipelineByPropertyName = $True)]
		[String]$text
	)

	PROCESS {

		$Null = Invoke-PACLICommand $Script:PV.ClientPath ADDNOTE $($PSBoundParameters | ConvertTo-ParameterString)



	}

}