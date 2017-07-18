Function Invoke-PACLICommand{

    <#
    .SYNOPSIS

    .DESCRIPTION

    .EXAMPLE

        
    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: July 2017
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True,Position=1)]
        [string]$PacliEXE,
        [Parameter(Mandatory=$True,Position=2)]
        [string]$PacliCommand,
        [Parameter(Mandatory=$False,Position=3)]
        [string]$CommandParameters
    )

        Begin{
            
            $PacliProcess = new-object System.Diagnostics.Process
        
        }
        
        Process{
            
            Write-Debug "PACLI Command: $PacliCommand $CommandParameters"

            $PacliProcess.StartInfo.Filename = $PacliEXE
            $PacliProcess.StartInfo.Arguments = "$PacliCommand $CommandParameters"
            $PacliProcess.StartInfo.RedirectStandardOutput = $True
            $PacliProcess.StartInfo.RedirectStandardError = $True
            $PacliProcess.StartInfo.UseShellExecute = $False
            $PacliProcess.start()
            $PacliProcess.WaitForExit()

    }
        
        End{

            Write-Debug "Exit Code: $($PacliProcess.ExitCode)"
            
            [PSCustomObject] @{

                "ExitCode" = $PacliProcess.ExitCode
                "StdOut" = $PacliProcess.StandardOutput.ReadToEnd()
                "StdErr" = $PacliProcess.StandardError.ReadToEnd()
                
            }

        }
        
}