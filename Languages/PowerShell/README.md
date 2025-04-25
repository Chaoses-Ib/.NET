# [PowerShell](https://learn.microsoft.com/en-us/powershell/)
[GitHub](https://github.com/PowerShell/PowerShell), [Wikipedia](https://en.wikipedia.org/wiki/PowerShell)

Overview:
- [What is PowerShell?](https://learn.microsoft.com/en-us/powershell/scripting/overview)
- [What is a PowerShell command?](https://learn.microsoft.com/en-us/powershell/scripting/powershell-commands)

## Tutorials
- [Learning PowerShell](https://github.com/PowerShell/PowerShell/tree/master/docs/learning-powershell)
  - [PowerShell Beginner’s Guide](https://github.com/PowerShell/PowerShell/blob/master/docs/learning-powershell/powershell-beginners-guide.md)
- [PowerShell 101](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/00-introduction)

## Help
[Discover PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/discover-powershell)

- Get-Help
  - Help
- Get-Verb
- Get-Command
- Get-Member

### Failed to update Help
```powershell
> Update-Help -UICulture en-US  
Update-Help: Failed to update Help for the module(s) 'DefenderPerformance, Dism, Get-NetView, Kds, NetQos, PcsvDevice, Pester, PKI, Whea, WindowsUpdate' with UI culture(s) {en-US} : One or more errors occurred. (Response status code does not indicate success: 404 (The specified blob does not exist.).).  
English-US help content is available and can be installed using: Update-Help -UICulture en-US.
```

Workaround[^update-help-so]:
```powershell
Update-Help -UICulture en-US -Verbose -Force -ErrorAction SilentlyContinue
```

[update-help fails for 'ConfigDefenderPerformance, PSReadline' -UICulture en-US. · Issue #17067 · PowerShell/PowerShell](https://github.com/PowerShell/PowerShell/issues/17067)

## Autocomplete
- [posh-tabcomplete: Blazing fast tab completion for powershell.](https://github.com/domsleee/posh-tabcomplete)

## Libraries
Rust:
- [powershell-script: A Crate for running Windows PowerShell scripts](https://github.com/cfsamson/powershell-script) (inactive)

  > On Windows it defaults to using the PowerShell which ships with Windows, but you can also run scripts using PowerShell Core on Windows by enabling the `core` feature.
- [pwsh-host-rs: Rust PowerShell Hosting Library](https://github.com/Devolutions/pwsh-host-rs/tree/master)
- [powershell](https://docs.rs/powershell/0.2.0/powershell/) (discontinued)
- [powershell\_rs: A Rust-friendly way to invoke Powershell commands](https://github.com/gurry/powershell_rs) (discontinued)
- [execRemoteSigned: A Rust program to set the PowerShell execution policy to RemoteSigned, enabling the execution of local unsigned and remote signed scripts on Windows. Requires administrative privileges.](https://github.com/mranv/execRemoteSigned)

[Extending PowerShell with Rust | Researching the optimal; implementing the practical](https://dfinke.github.io/powershell/2019/07/21/Extending-PowerShell-with-Rust.html)

## Information sources
Blogs:
- [PowerShell Team - Automating the world one-liner at a time…](https://devblogs.microsoft.com/powershell/)
- [PowerShell Community](https://devblogs.microsoft.com/powershell-community/)  
- [Scripting Blog - A place to learn about PowerShell and share stories of automation](https://devblogs.microsoft.com/scripting/)


[^update-help-so]: [Powershell fails with Update - Stack Overflow](https://stackoverflow.com/questions/39834452/powershell-fails-with-update)