## Synopsis
PowerShell wrapper for Sublime Text's subl utility.

## Status

| Platform | Build status |
| --- | --- |
| Windows | [![Windows Build Status](https://theaquamarine.visualstudio.com/posubl/_apis/build/status/theaquamarine.posubl?branchName=azure-pipelines&jobName=Job&configuration=Job%20Linux)](https://theaquamarine.visualstudio.com/posubl/_build/latest?definitionId=2&branchName=azure-pipelines) |
| macOS | [![macOS Build Status](https://theaquamarine.visualstudio.com/posubl/_apis/build/status/theaquamarine.posubl?branchName=master&jobName=Job&configuration=Job%20macOS)](https://theaquamarine.visualstudio.com/posubl/_build/latest?definitionId=2&branchName=master) |
| Linux | [![Linux Build Status](https://theaquamarine.visualstudio.com/posubl/_apis/build/status/theaquamarine.posubl?branchName=master&jobName=Job&configuration=Job%20Linux)](https://theaquamarine.visualstudio.com/posubl/_build/latest?definitionId=2&branchName=master) |

## Installation
Download or install [from the PowerShell Gallery](https://www.powershellgallery.com/packages/posubl) with `Install-Module -Name posubl` and add `Import-Module posubl` to your `$profile`. 
Add the location of the `subl` binary to `-ArgumentList` if Sublime is installed in a non-standard location, for example if using a portable version.

This imports the command `Invoke-SublimeText` and the aliases `sublime` and `subl`.

## Usage
`Invoke-SublimeText` exposes all of `subl`'s parameters with both long and short form arguments available.

| Parameter | Description |
| --- | --- |
| Files | Files to edit. File names may be given a :line or :line:column suffix to open at a specific location. |
| Project | Project to load. |
| Command | Command to run. |
| NewWindow | Open a new window. |
| Add | Add folders to the current window. |
| Wait | Wait for the files to be closed before returning. |
| Background | Don't activate the application. |
| Stay | Keep the application activated after closing the file. |
| Help | Show help and exit. |
| Version | Show version and exit. |
