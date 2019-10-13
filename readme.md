## Synopsis
PowerShell wrapper for Sublime Text's subl.exe utility.

## Installation
Download or install [from the PowerShell Gallery](https://www.powershellgallery.com/packages/posubl) with `Install-Module -Name posubl` and add `Import-Module posubl` to your `$profile`, with the location of `subl.exe` if not at `C:\Program Files\Sublime Text 3\subl.exe`.

This imports the command `Invoke-SublimeText` and the alias `sublime`.

## Usage
`Invoke-SublimeText` exposes all of `subl.exe`'s parameters with both long and short form arguments available.

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
