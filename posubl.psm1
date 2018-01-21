<#
.Synopsis
    PowerShell wrapper for Sublime Text's subl.exe utility.
.Parameter subl
    Location of subl.exe. Defaults to C:\Program Files\Sublime Text 3\subl.exe.
#>

param(
    # Override posubl's attempts at working out Sublime Text's location.
    $subl
    )

function Invoke-SublimeText {
    <#
    .Synopsis
        PowerShell wrapper for Sublime Text's subl.exe utility.
    .Parameter Files
        Files to edit. File names may be given a :line or :line:column suffix to open at a specific location.
    .Parameter Project
        Project to load.
    .Parameter Command
        Command to run.
    .Parameter NewWindow
        Open a new window.
    .Parameter Add
        Add folders to the current window.
    .Parameter Wait
        Wait for the files to be closed before returning.
    .Parameter Background
        Don't activate the application.
    .Parameter Stay
        Keep the application activated after closing the file.
    .Parameter Help
        Show help and exit.
    .Parameter Version
        Show version and exit.
    #>

    [CmdletBinding()]
    param(
        [Parameter(ValuefromPipeline=$True, ValuefromPipelineByPropertyName=$True)][Alias('Directories')][String[]] $Files,
        $Project,
        [Parameter(ValuefromPipelineByPropertyName=$True)][string] $Command,
        [Switch][Alias('New-Window','n')] $NewWindow,
        [Switch][Alias('a')] $Add,
        [Switch][Alias('w')] $Wait,
        [Switch][Alias('b')] $Background,
        [Switch][Alias('s')] $Stay,
        [Switch][Alias('h')] $Help,
        [Switch][Alias('v')] $Version
        )

    begin {
        $arguments = @()
        if ($Project) {
            if ($Project -isnot [String]) {
                $Project = $Project.FullName
            }
            $arguments += "--project $Project"
        }
        if ($Command) {
            $arguments += "--command $Command"
        }
        if ($NewWindow) {
            $arguments += '--new-window'
        }
        if ($Add) {
            $arguments += '--add'
        }
        if ($Wait) {
            $arguments += '--wait'
        }
        if ($Background) {
            $arguments += '--background'
        }
        if ($Stay) {
            $arguments += '--stay'
        }
        if ($Help) {
            $arguments += '--help'
        }
        if ($Version) {
            $arguments += '--version'
        }

    }

    process {
        Foreach ($File in $Files)
        {
            #Test if string, if not, get name.
            if ($File -isnot [String]) {
                $File = $File.FullName
            }
            $arguments += $File
        }
    }

    end {
        & $subl $arguments
    }
}


$subl = if ($subl) {$subl} else {
    $installPath = ''
    $sublPath = ''
    if ($isMacOS) {
        $installPath = "~/Applications","/Applications"
        $sublPath = 'Sublime Text.app/Contents/SharedSupport/bin/subl'
    } elseif ($isLinux) {
        #sublimetext.info docs suggest these
        $installPath = '/opt/Sublime Text 3'
        $sublPath = 'sublime_text'
    } else {
        # It's probably Windows
        $installPath = $env:ProgramFiles,${env:ProgramFiles(x86)}
        $sublPath = 'Sublime Text 3\subl.exe'
    }
    Join-Path $installPath $sublPath | ?{Test-Path $_} | Select -First 1
}

# New-Alias subl Invoke-SublimeText
New-Alias sublime Invoke-SublimeText

Export-ModuleMember -Function Invoke-SublimeText
Export-ModuleMember -Alias sublime
