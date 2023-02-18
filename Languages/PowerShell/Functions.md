# Functions
```powershell
function Get-MrPSVersion {
    $PSVersionTable.PSVersion
}
```

## Parameters
```powershell
function Test-MrParameter {
    param (
        [Parameter(Mandatory)]
        [string]$ComputerName
    )
    
    Write-Output $ComputerName
}
```

## [Advanced functions](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced)
```powershell
function Test-MrParameter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$ComputerName
    )
    
    Write-Output $ComputerName
}
```

[about Functions CmdletBindingAttribute](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_cmdletbindingattribute?view=powershell-7.3)
- [about CommonParameters](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.3)
  - Debug (db)
  - ErrorAction (ea)
  - ErrorVariable (ev)
  - InformationAction (infa)
  - InformationVariable (iv)
  - OutVariable (ov)
  - OutBuffer (ob)
  - PipelineVariable (pv)
  - Verbose (vb)
  - WarningAction (wa)
  - WarningVariable (wv)

- SupportsShouldProcess
  - Confirm
  - WhatIf

## Pipeline input
```powershell
function Test-MrParameter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName)]
        [string[]]$ComputerName
    )
    
    PROCESS {
        Write-Output $ComputerName
    }
}
```

## Comment-based help
```powershell
function Get-MrAutoStoppedService {

<#
.SYNOPSIS
    Returns a list of services that are set to start automatically, are not
    currently running, excluding the services that are set to delayed start.

.DESCRIPTION
    Get-MrAutoStoppedService is a function that returns a list of services from
    the specified remote computer(s) that are set to start automatically, are not
    currently running, and it excludes the services that are set to start automatically
    with a delayed startup.

.PARAMETER ComputerName
    The remote computer(s) to check the status of the services on.

.PARAMETER Credential
    Specifies a user account that has permission to perform this action. The default
    is the current user.

.EXAMPLE
    Get-MrAutoStoppedService -ComputerName 'Server1', 'Server2'

.EXAMPLE
    'Server1', 'Server2' | Get-MrAutoStoppedService

.EXAMPLE
    Get-MrAutoStoppedService -ComputerName 'Server1' -Credential (Get-Credential)

.INPUTS
    String

.OUTPUTS
    PSCustomObject

.NOTES
    Author: Mike F Robbins
    Website: http://mikefrobbins.com
    Twitter: @mikefrobbins
#>

    [CmdletBinding()]
    param (
    
    )

    #Function Body

}
```