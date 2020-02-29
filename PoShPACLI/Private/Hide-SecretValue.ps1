Function Hide-SecretValue {
	<#
    .SYNOPSIS
    Hide a secret value by converting it to "******"

    .DESCRIPTION
    Matches a pattern in a string which is expected to contain a secret value.
    Replaces all secret values with "******", and returns a sanitised string.
    Enables a command string to be included in debug/verbose streams without exposing secret values.

    .PARAMETER InputValue
    Command String

    .PARAMETER SecretsToRemove
    Any additional command parameters which should be sanitised.

    .PARAMETER Secrets
    PoShPACLI default parameters known to contain secrets

	.EXAMPLE
	Hide-SecretValue -inputValue 'user="administrator" password="SecretValue" sessionID=666 vault="somevault"'

	user="administrator" password="******" sessionID=666 vault="somevault"

	Masks secret value in command string

    #>
	[CmdletBinding()]
	[OutputType('System.String')]
	param(
		[parameter(
			Position = 0,
			Mandatory = $false,
			ValueFromPipeline = $true)]
		[String]$InputValue,

		[parameter(
			Mandatory = $false)]
		[array]$SecretsToRemove = @(),

		[parameter(
			Mandatory = $false)]
		[array]$Secrets = @(
			"password",
			"newPassword",
			"proxyPassword"
		)
	)

	BEGIN {



	}#begin

	PROCESS {

		$OutputValue = $InputValue

		#Combine base parameters and any additional parameters to remove
		($SecretsToRemove + $Secrets) |

		ForEach-Object {

			$OutputValue = $OutputValue -replace '(password=")\S+', "`$1******`""

		}

	}#process

	END {

		#Return Output
		$OutputValue

	}#end

}