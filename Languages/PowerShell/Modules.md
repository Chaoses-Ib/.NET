# Modules
[PowerShell Gallery](https://www.powershellgallery.com/)

## Dot-sourcing functions
Get-MrPSVersion.ps1:
```powershell
function Get-MrPSVersion {
    $PSVersionTable.PSVersion
}
```

```powershell
. .\Get-MrPSVersion.ps1
```

## Script Modules
Get-MrPSVersion.psm1:
```powershell
function Get-MrPSVersion {
    $PSVersionTable.PSVersion
}
```

```powershell
Import-Module C:\Get-MrPSVersion.psm1
```

In order to take advantage of module autoloading, a script module needs to be saved in a folder with the same base name as the PSM1 file and in a location specified in `$env:PSModulePath`.

## Dynamic modules
```powershell
New-Module -Name MyModule -ScriptBlock {

    function Get-MrOsVersion {
        Get-CimInstance -ClassName Win32_OperatingSystem |
        Select-Object -Property @{label='OperatingSystem';expression={$_.Caption}}
    }

    Export-ModuleMember -Function Get-MrOsVersion

} | Import-Module
```