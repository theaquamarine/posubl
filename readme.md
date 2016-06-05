##Synopsis
PowerShell wrapper for Sublime Text's subl.exe utility.

##Installation
Download and add `Import-Module posubl` to your $profile, with the location of `subl.exe` if not at `C:\Program Files\Sublime Text 3\subl.exe`.

This imports the command `Invoke-SublimeText` and the alias and `sublime`.

##Usage
`Invoke-SublimeText` exposes all of `subl.exe`'s parameters with both long and short form arguments available.
