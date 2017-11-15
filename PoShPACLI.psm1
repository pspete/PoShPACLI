<#
.SYNOPSIS

.DESCRIPTION

.EXAMPLE

.INPUTS

.OUTPUTS

.NOTES

.LINK

#>
[CmdletBinding()]
param()

#Get function files
Write-Verbose $PSScriptRoot

Get-ChildItem $PSScriptRoot\ -Recurse -Filter "*.ps1" -Exclude "*.ps1xml" |

ForEach-Object {

	Try {
		# Dot Source each file
		. (
			[scriptblock]::Create(
				[io.file]::ReadAllText($_.fullname, [Text.Encoding]::UTF8)
			)
		)

	} Catch {

		Write-Error "Failed to import function $($_.fullname)"

	}


}