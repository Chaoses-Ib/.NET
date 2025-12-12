#import "@local/ib:0.1.0": *
#title[Performance]
= Startup
- Profiles: `$profile | select *`
  - `-NoProfile`
- Anti-virus

#t[1705]
#a[performance - Powershell slow starting on Windows 10 - Super User][https://superuser.com/questions/1212442/powershell-slow-starting-on-windows-10]

#t[2210]
#a[PowerShell starting extremely slowly - ideas for debugging sought : r/PowerShell][https://www.reddit.com/r/PowerShell/comments/yfhjf6/powershell_starting_extremely_slowly_ideas_for/]

== Benchmarks
- `powershell -NoProfile`: 200ms (v5.1.26100.6725)
- `pwsh -NoProfile`: 210ms (v7.5.4)
- vcpkg: 190ms
  - `vcpkg autocomplete`
  ```pwsh
  Import-Module 'C:\Users\Chaoses\scoop\apps\vcpkg\current\scripts\posh-vcpkg'
  ```
- uv: 350ms (v0.9.10)
  ```pwsh
  (& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
  (& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression
  ```
- Conda: 3330ms (v23.1.0)
  ```pwsh
  #region conda initialize
  # !! Contents within this block are managed by 'conda init' !!
  (& "C:\ProgramData\Miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
  #endregion
  ```
  #a[Slow startup of Powershell Core - Issue #17734 - PowerShell/PowerShell][https://github.com/PowerShell/PowerShell/issues/17734]
  - #a[conda init powershell slows shell startup immensely. - Issue #11648 - conda/conda][https://github.com/conda/conda/issues/11648]
- Conda + uv + vcpkg: 4100ms

#a[pwsh-startup: A tool for measuring the Powershell startup time.][https://github.com/kotek-7/pwsh-startup]
#a-badge[https://crates.io/crates/pwsh-startup]
- `pwsh -c exit`
- `cargo install pwsh-startup`
