# [Providers](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_providers)
Built-in providers:
```powershell
> Get-PSProvider

Name                 Capabilities                                      Drives
----                 ------------                                      ------
Registry             ShouldProcess                                     {HKLM, HKCU}
Alias                ShouldProcess                                     {Alias}
Environment          ShouldProcess                                     {Env}
FileSystem           Filter, ShouldProcess, Credentials                {C, Temp}
Function             ShouldProcess                                     {Function}
Variable             ShouldProcess                                     {Variable}
```
